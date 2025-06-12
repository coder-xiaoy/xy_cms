package v1

import (
	"github.com/gin-gonic/gin"
	"xy_cms/internal/request"
	"xy_cms/internal/service"
)

type CategoryHandler struct {
	categoryService service.ICategoryService
}

func NewCategoryHandler(categoryService service.ICategoryService) *CategoryHandler {
	return &CategoryHandler{
		categoryService: categoryService,
	}
}
func (h *CategoryHandler) Index(c *gin.Context) {
	category, err := h.categoryService.GetCategoryById(1)

	c.JSON(200, gin.H{"category": category, "err": err})
}

func (h *CategoryHandler) Update(c *gin.Context) {

}
func (h *CategoryHandler) Delete(c *gin.Context) {

}
func (h *CategoryHandler) Create(c *gin.Context) {

}
func (h *CategoryHandler) List(c *gin.Context) {
	pageRequest := request.PageRequest{}
	err := c.ShouldBind(&pageRequest)
	if err != nil {
		c.JSON(200, gin.H{"err": err.Error()})
		return
	}
	category, err := h.categoryService.GetCategoryList(pageRequest)
	c.JSON(200, gin.H{"categoryList": category, "err": err})
	return
}
func (h *CategoryHandler) Show(c *gin.Context) {
	category, err := h.categoryService.GetCategoryById(1)

	c.JSON(200, gin.H{"category": category, "err": err})
}
