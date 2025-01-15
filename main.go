package main

import (
	"context"
	"fmt"
	"github.com/flosch/pongo2/v6"
	"github.com/gin-gonic/gin"
	swaggerFiles "github.com/swaggo/files"
	ginSwagger "github.com/swaggo/gin-swagger"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
	"gorm.io/gorm/schema"
	"log"
	"net/http"
	"os"
	"os/signal"
	"strconv"
	"sync"
	"syscall"
	"time"
	"xy_cms/docs"
	"xy_cms/internal/controller"
	"xy_cms/internal/controller/admin"
	"xy_cms/internal/model"
	"xy_cms/internal/providers"
	_ "xy_cms/internal/providers/tags"
	_ "xy_cms/internal/providers/validator"
	"xy_cms/internal/repository"
	"xy_cms/internal/service"
)

type name struct {
	Name int
}

func (r name) Set() name {
	r.Name = 333
	return r
}

type Ad struct {
	Data map[string]interface{}
}

// TableName Admin's table name
func (*Ad) TableName() string {
	return "admin"
}

// @title           Swagger Example API
// @version         1.0
// @description     This is a sample server celler server.
// @termsOfService  http://swagger.io/terms/

// @contact.name   API Support
// @contact.url    http://www.swagger.io/support
// @contact.email  support@swagger.io

// @license.name  Apache 2.0
// @license.url   http://www.apache.org/licenses/LICENSE-2.0.html

// @host      localhost:8080
// @BasePath  /api/v1

// @securityDefinitions.basic  BasicAuth

// @externalDocs.description  OpenAPI
// @externalDocs.url          https://swagger.io/resources/open-api/
func main() {
	// programatically set swagger info
	docs.SwaggerInfo.Title = "Swagger Example API"
	docs.SwaggerInfo.Description = "This is a sample server Petstore server."
	docs.SwaggerInfo.Version = "1.0"
	docs.SwaggerInfo.Host = "localhost:8000"
	docs.SwaggerInfo.BasePath = ""
	docs.SwaggerInfo.Schemes = []string{"http", "https"}
	dsn := "root:123456@tcp(192.168.147.115:3306)/test?charset=utf8mb4&parseTime=True&loc=Local"
	db, _ := gorm.Open(mysql.Open(dsn), &gorm.Config{
		Logger: logger.Default.LogMode(logger.Info),
	})
	sqlDb, _ := db.DB()
	sqlDb.SetConnMaxLifetime(1 * time.Hour)
	sqlDb.SetConnMaxIdleTime(5)
	sqlDb.SetMaxOpenConns(10)
	sqlDb.SetMaxIdleConns(5)
	repository.SetDefault(db)
	s := name{Name: 11}
	ss := s.Set()
	fmt.Printf("Address of p: %p\n", &s)
	fmt.Printf("Address of p: %p\n", &ss)
	var re []map[string]interface{}

	db.Model(model.Admin{}).First(&re)
	fmt.Println(re)
	rows, _ := db.Table("admin").Joins("left join admin_group on admin.group_id = admin_group.id").Rows()
	columnNames, err := rows.Columns()
	if err != nil {
		fmt.Println("Error getting column names:", err)
		return
	}
	fmt.Println(columnNames)
	result := map[string]interface{}{}

	for rows.Next() {
		admin := model.Admin{}

		columns := make(map[string]string)
		s, _ := schema.Parse(admin, &sync.Map{}, schema.NamingStrategy{})
		// 遍历字段

		for _, field := range s.Fields {
			columns[field.Name] = field.DBName
		}
		//	fmt.Println(ss)
		//for i := 0; i < v.NumField(); i++ {
		//	field := t.Field(i)
		//	columnTag := field.Tag.Get("gorm")
		//	if columnTag != "" {
		//		// 提取 `column` 标签中的列名
		//		column := field.Tag.Get("gorm")
		//		columns[field.Name] = column
		//	}
		//}
		fmt.Println(columns)
		db.ScanRows(rows, &result)
		db.ScanRows(rows, &admin)

		delete(result, "password")
		//	if v, ok := result["id"]; ok {
		//fmt.Println(v)
		//	}
		fmt.Println(result)
		//fmt.Println(admin)
		//fmt.Println(time.Unix(1728985538, 0).Format("2006-01-02 15:04:05.000"))

	}

	//if true {
	//	return
	//}
	//err = repository.Q.Transaction(context.Background(), func(query *repository.Query) error {
	//	m, _ := query.CategoryRepository.GetCategoryByCategoryId(1)
	//	fmt.Println(m.CatName)
	//	m.CatName = "66666"
	//	query.CategoryRepository.UpdateById(&m, 1)
	//	fmt.Println(query.CategoryRepository.GetCategoryByCategoryId(1))
	//	fmt.Println("gd")
	//
	//	fmt.Println(repository.Q.CategoryRepository.GetCategoryByCategoryId(1))
	//	return nil
	//})
	//fmt.Println(repository.Q.CategoryRepository.GetCategoryByCategoryId(1))
	//if err != nil {
	//	return
	//}
	//if true {
	//	return
	//}
	r := gin.Default()
	r.HTMLRender = providers.NewPengo2Render(providers.RenderOptions{
		TemplateDir: "resources/views",
		TemplateSet: nil,
		ContentType: "text/html; charset=utf-8",
	})
	//r.SetFuncMap(template.FuncMap{"isEven": IsEven, "test": Test, "loop": utils.Loop})
	//r.LoadHTMLFiles("resources/views/admin/model/index.html")
	r.GET("/ping", func(context *gin.Context) {
		id, _ := strconv.ParseInt(context.Query("id"), 0, 64)
		res, _ := repository.ContentRepository.GetContentByCategoryId(uint64(id))
		service.ContentService.GetContentByContentId(132)
		context.JSON(http.StatusOK, res)
	})
	r.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))
	r.Static("/static", "./resources/static")
	r.StaticFile("/favicon.ico", "./resources/static/admin/images/t_9.gif")
	r.GET("/show", controller.ContentController.Show)
	r.Use()
	adminGroup := r.Group("/admin")
	{

		adminGroup.GET("/model", func(c *gin.Context) {
			res, _ := service.ModelMService.GetList()
			c.HTML(http.StatusOK, "admin/model/index.html", pongo2.Context{"name": "Pongo2", "res2": res})
		})
		adminGroup.GET("/category", admin.CategoryController.Index)
		adminGroup.POST("/category", admin.CategoryController.Save)
		adminGroup.GET("/category/:id", admin.CategoryController.Show)
		adminGroup.POST("/category/:id", admin.CategoryController.Update)
		adminGroup.GET("/category/:id/delete", admin.CategoryController.Delete)
		adminGroup.GET("/setting", admin.SettingController.Show)
		adminGroup.POST("/setting", admin.SettingController.Update)
	}
	apiGroup := r.Group("/api")
	{
		v1 := apiGroup.Group("/v1")
		{
			v1.GET("category", controller.CmsCategoryController.GetList)
		}
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
