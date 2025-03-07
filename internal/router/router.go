package router

import (
	"github.com/flosch/pongo2/v6"
	"github.com/gin-gonic/gin"
	swaggerFiles "github.com/swaggo/files"
	ginSwagger "github.com/swaggo/gin-swagger"
	"net/http"
	"xy_cms/internal/controller"
	"xy_cms/internal/controller/admin"
	"xy_cms/internal/service"
)

func Init(r *gin.Engine) {
	r.GET("/ping", func(context *gin.Context) {
		//id, _ := strconv.ParseInt(context.Query("id"), 0, 64)
		//res, _ := repository.ContentRepository.GetContentByCategoryId(uint64(id))
		//service.ContentService.GetContentByContentId(132)
		context.JSON(http.StatusOK, 123)
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
}
