package main

import (
	"context"
	"fmt"
	"github.com/gin-gonic/gin"
	"golang.org/x/exp/slog"
	"io"
	"log"
	"net/http"
	"os"
	"os/signal"
	"strings"
	"syscall"
	"time"
	"xy_cms/internal"
	"xy_cms/internal/bootstrap"
	"xy_cms/internal/dal/query"
	"xy_cms/internal/db"
	"xy_cms/internal/providers"
	_ "xy_cms/internal/providers/tags"
	_ "xy_cms/internal/providers/validator"
	"xy_cms/internal/repository"
	"xy_cms/internal/request"
	"xy_cms/internal/router"
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
func redirectGinLogToSlog() {
	gin.DefaultWriter = &ginLogAdapter{}
	gin.DefaultErrorWriter = &ginErrorLogAdapter{}
}

// 适配器将 Gin 日志转为 slog.Info
type ginLogAdapter struct{}

func (a *ginLogAdapter) Write(p []byte) (n int, err error) {

	slog.Info(strings.TrimSpace(string(p)))
	return len(p), nil
}

// 适配器将 Gin 错误日志转为 slog.Error
type ginErrorLogAdapter struct{}

func (a *ginErrorLogAdapter) Write(p []byte) (n int, err error) {
	slog.Error(strings.TrimSpace(string(p)))
	return len(p), nil
}

func main() {
	f, _ := os.OpenFile("xy_cms.log", os.O_CREATE|os.O_APPEND|os.O_WRONLY, 0666)
	multiWriter := io.MultiWriter(f, os.Stdout)
	handler := slog.NewTextHandler(multiWriter, &slog.HandlerOptions{
		Level:     slog.LevelDebug,
		AddSource: true,
	})
	slog.SetDefault(slog.New(handler))

	// 初始化配置文件
	bootstrap.InitConfig()
	bootstrap.InitDB()
	repository.SetDefault(db.GetDb())
	query.SetDefault(db.GetDb())
	internal.InitializeCategoryControllerV2().Test()
	s := service.BlockServiceImpl{}
	list, err := s.GetBlockList(request.PageRequest{
		Page:     1,
		PageSize: 1,
	})
	fmt.Println(list)
	if err != nil {
		return
	}
	r := gin.Default()
	r.HTMLRender = providers.NewPengo2Render(providers.RenderOptions{
		TemplateDir: "resources/views",
		TemplateSet: nil,
		ContentType: "text/html; charset=utf-8",
	})
	router.Init(r)
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
