package main

import (
	"context"
	"github.com/flosch/pongo2/v6"
	"github.com/gin-gonic/gin"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
	"html/template"
	"log"
	"net/http"
	"os"
	"os/signal"
	"reflect"
	"strconv"
	"syscall"
	"time"
	"xy_cms/internal/app/controller"
	"xy_cms/internal/app/controller/admin"
	"xy_cms/internal/app/providers"
	_ "xy_cms/internal/app/providers/tags"
	"xy_cms/internal/app/repository"
	"xy_cms/internal/app/service"
	"xy_cms/internal/app/utils"
)

func IsEven(num any) bool {
	types := []reflect.Kind{reflect.Int, reflect.Int8, reflect.Int16, reflect.Int32, reflect.Int64}
	res := false
	numType := reflect.TypeOf(num)
	for _, t := range types {
		if numType.Kind() == t {
			res = reflect.ValueOf(num).Int()%2 == 0
			break
		}
	}
	return res
}

type Result struct {
	Pages []string
	Data  []string
}

func Test() []interface{} {
	s, _ := service.ModelMService.GetList()
	var s1 = make([]interface{}, 0)
	for _, v := range s {
		s1 = append(s1, v)
	}
	return s1
}
func main() {

	dsn := "root:123456@tcp(192.168.147.115:3306)/test?charset=utf8mb4&parseTime=True&loc=Local"
	db, _ := gorm.Open(mysql.Open(dsn), &gorm.Config{
		Logger: logger.Default.LogMode(logger.Info),
	})
	repository.SetDefault(db)
	r := gin.Default()
	r.HTMLRender = providers.NewPengo2Render(providers.RenderOptions{
		TemplateDir: "resources/views/admin",
		TemplateSet: nil,
		ContentType: "text/html; charset=utf-8",
	})
	r.SetFuncMap(template.FuncMap{"isEven": IsEven, "test": Test, "loop": utils.Loop})
	//r.LoadHTMLFiles("resources/views/admin/model/index.html")
	r.GET("/ping", func(context *gin.Context) {
		id, _ := strconv.ParseInt(context.Query("id"), 0, 64)
		res, _ := repository.ContentRepository.GetContentByCategoryId(uint64(id))
		service.ContentService.GetContentByContentId(132)
		context.JSON(http.StatusOK, res)
	})
	r.GET("/show", controller.ContentController.Show)

	adminGroup := r.Group("/admin")
	{
		adminGroup.GET("/model", func(c *gin.Context) {
			res, _ := service.ModelMService.GetList()
			c.HTML(http.StatusOK, "model/index.html", pongo2.Context{"name": "Pongo2", "res2": res})
		})
		adminGroup.POST("/category", admin.CategoryController.Save)
		adminGroup.GET("/category/:id", admin.CategoryController.Show)
	}

	srv := &http.Server{
		Addr:           ":8000",
		Handler:        r,
		ReadTimeout:    20 * time.Second,
		WriteTimeout:   20 * time.Second,
		MaxHeaderBytes: 1024,
	}
	go func() {
		// 服务连接
		if err := srv.ListenAndServe(); err != nil && err != http.ErrServerClosed {
			log.Fatalf("listen: %s\n", err)
		}
	}()
	// Wait for interrupt signal to gracefully shutdown the server with
	// a timeout of 5 seconds.
	quit := make(chan os.Signal, 1)
	// kill (no param) default send syscall.SIGTERM
	// kill -2 is syscall.SIGINT
	// kill -9 is syscall.SIGKILL but can't be catch, so don't need add it
	signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)
	<-quit
	log.Println("Shutting down server...")

	// The context is used to inform the server it has 5 seconds to finish
	// the request it is currently handling
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	if err := srv.Shutdown(ctx); err != nil {
		log.Fatal("Server forced to shutdown: ", err)
	}

	log.Println("Server exiting")
}
