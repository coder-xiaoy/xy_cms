package admin

import (
	"fmt"
	"github.com/flosch/pongo2/v6"
	"github.com/gin-gonic/gin"
	"github.com/gin-gonic/gin/binding"
	"net/http"
	"strconv"
	"xy_cms/internal/app/providers/validator"
	"xy_cms/internal/app/request"
	"xy_cms/internal/app/service"
)

type categoryController struct {
	errorController
}

func newCategoryController() categoryController {
	return categoryController{}
}
func (c *categoryController) Save(ctx *gin.Context) {
	categoryRequest := request.CategoryRequest{}
	err := ctx.ShouldBindWith(&categoryRequest, binding.FormPost)
	if err != nil {
		c.ShowMsg(ctx, "-1", validator.TranslateSliceErrors(err, "form"))
		return
	}

	if service.CategoryService.Save(categoryRequest) {
		c.ShowMsg(ctx, "-1", []string{"保存成功"})
	} else {
		c.ShowMsg(ctx, "-1", []string{"保存失败"})
	}
}

func (c *categoryController) Update(ctx *gin.Context) {
	categoryRequest := request.CategoryRequest{}
	err := ctx.ShouldBindWith(&categoryRequest, binding.FormPost)
	if err != nil {
		c.ShowMsg(ctx, "-1", validator.TranslateSliceErrors(err, "form"))
		return
	}
	id, _ := strconv.ParseInt(ctx.Param("id"), 10, 64)
	fmt.Print(fmt.Sprintf("%+v", categoryRequest))
	if service.CategoryService.UpdateByCategoryId(ctx.Request.Context(), categoryRequest, id) {
		ctx.String(http.StatusOK, "保存成功")
	} else {
		ctx.String(http.StatusOK, "save failed")
	}
}
func (c *categoryController) Show(ctx *gin.Context) {
	var id int64
	paramsId, _ := ctx.Params.Get("id")
	id, _ = strconv.ParseInt(paramsId, 10, 64)
	category, _ := service.CategoryService.GetCategoryById(id)
	categoryList := service.CategoryService.GetAll()
	templateList := service.TemplateService.GetThemeTemplateList("default")
	modelList, _ := service.ModelMService.GetList()
	action := "/admin/category"
	if id > 0 {
		action += "/" + paramsId
	}
	ctx.HTML(http.StatusOK, "admin/category/show.html", pongo2.Context{
		"category":     category,
		"categoryList": categoryList,
		"templateList": templateList,
		"modelList":    modelList,
		"action":       action,
	})
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
