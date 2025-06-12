package admin

import (
	"context"
	"fmt"
	"github.com/flosch/pongo2/v6"
	"github.com/gin-gonic/gin"
	"github.com/gin-gonic/gin/binding"
	"log/slog"
	"net/http"
	"strconv"
	errors2 "xy_cms/internal/errors"
	"xy_cms/internal/providers/validator"
	"xy_cms/internal/request"
	"xy_cms/internal/service"
)

type categoryController struct {
	errorController
}
type CategoryControllerV2 struct {
	categoryService service.ICategoryService
}

func (receiver CategoryControllerV2) Test() {
	result, err := receiver.categoryService.GetCategoryById(1)
	slog.Info("Test", result, err)

}
func NewCategoryControllerV2(categoryService service.ICategoryService) CategoryControllerV2 {
	return CategoryControllerV2{categoryService: categoryService}
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

	if res, _ := service.CategoryService.Save(categoryRequest); res == true {
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
		c.ShowMsg(ctx, "-1", []string{"保存成功"})
	} else {
		c.ShowMsg(ctx, "-1", []string{"保存失败"})
	}
}
func (c *categoryController) Show(ctx *gin.Context) {
	var id int64
	paramsId, _ := ctx.Params.Get("id")
	id, _ = strconv.ParseInt(paramsId, 10, 64)
	category, _ := service.CategoryService.GetCategoryById(id, ctx.Request.Context())
	categoryList := service.CategoryService.GetAllDeep(ctx.Request.Context())
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
	categoryList := service.CategoryService.GetAllDeep(ctx.Request.Context())
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
func (c *categoryController) Delete(ctx *gin.Context) {
	idString, ok := ctx.Params.Get("id")
	if !ok {
		c.ShowMsg(ctx, "-1", []string{"栏目不存在"})
		return
	}
	id, err := strconv.ParseInt(idString, 10, 64)
	if err != nil {
		c.ShowMsg(ctx, "-1", []string{"栏目不存在"})
		return
	}
	err = service.CategoryService.DeleteCategoryByID(ctx.Request.Context(), id)
	if err != nil {
		if deleteError, ok := err.(*errors2.ErrorServices); ok {
			c.ShowMsg(ctx, "-1", []string{deleteError.Error()})
			return
		} else {
			c.ShowMsg(ctx, "-1", []string{"删除失败"})
			return
		}
	}
	c.ShowMsg(ctx, "/admin/category/", []string{"删除成功"})
	return
}
func (c *categoryController) IndexAjax(ctx *gin.Context) {
	context1 := ctx.Request.Context()
	context.WithValue(context1, "1", 2)
	s := context1.Value("1")
	i := s.(int64)
	fmt.Println(i)
	//service.ContentService.Get
}
