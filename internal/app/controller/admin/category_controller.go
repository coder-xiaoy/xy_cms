package admin

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/gin-gonic/gin/binding"
	"net/http"
	"xy_cms/internal/app/request"
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
	id := ctx.Param("id")
	ctx.JSON(http.StatusOK, gin.H{"id": id})
}
