package admin

import (
	"fmt"
	"github.com/flosch/pongo2/v6"
	"github.com/gin-gonic/gin"
	"github.com/gin-gonic/gin/binding"
	"net/http"
	"xy_cms/internal/app/request"
	"xy_cms/internal/app/service"
)

type categoryController struct {
}

func newCategoryController() categoryController {
	return categoryController{}
}
func (c *categoryController) Save(ctx *gin.Context) {
	categoryRequest := request.CategoryRequest{}
	err := ctx.ShouldBindWith(&categoryRequest, binding.FormPost)
	if err != nil {
		fmt.Println(err)
	}
	ctx.JSON(http.StatusOK, gin.H{"err": err.Error()})
}
func (c *categoryController) Show(ctx *gin.Context) {

	service.CategoryService.GetAllTree()
	ctx.JSON(http.StatusOK, gin.H{"id": service.CategoryService.GetAllDeep()})
}
func (c *categoryController) Index(ctx *gin.Context) {
	categoryList := service.CategoryService.GetAllDeep()
	contentCountWithCategory, _ := service.ContentService.GetContentCountWithCategory()
	contentCount := make(map[int64]int64)
	for _, v := range contentCountWithCategory {
		contentCount[v.Catid] = v.Total
	}

	ctx.HTML(http.StatusOK, "admin/category/index.html", pongo2.Context{
		"categoryList": categoryList,
		"contentCount": contentCount,
	})
}
