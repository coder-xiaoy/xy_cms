package controller

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"strconv"
	"xy_cms/internal/app/service"
)

type contentController struct {
}

func (c contentController) Show(context *gin.Context) {
	context.Request.Context()
	id, _ := strconv.ParseInt(context.Query("id"), 0, 32)
	res, _ := service.ContentService.GetContentByContentId(int32(id))
	context.JSON(http.StatusOK, gin.H{
		"message": "pong",
		"data":    res,
	})
}
