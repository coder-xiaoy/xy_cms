package cms

import (
	"github.com/gin-gonic/gin"
	"xy_cms/internal/model"
	"xy_cms/internal/response"
	"xy_cms/internal/service"
)

type CategoryController struct {
}

// GetList godoc
// @Summary      List category
// @Description  get category
// @Tags         cms/category
// @Accept       json
// @Produce      json
// @Param        q    query     string  false  "name search by q"  Format(email)
// @Success      200  {object}   response.Result[[]model.Category]
// @Router       /api/v1/category [get]
func (c *CategoryController) GetList(ctx *gin.Context) {
	list := service.CategoryService.GetAll(ctx.Request.Context())
	response.Success[[]model.Category](ctx, "success", list)
	return
}
