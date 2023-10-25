package admin

import (
	"github.com/flosch/pongo2/v6"
	"github.com/gin-gonic/gin"
	"net/http"
)

type errorController struct {
}

func (e *errorController) ShowMsg(ctx *gin.Context, url string, message map[string]string) {
	ctx.HTML(http.StatusOK, "admin/layout/error.html", pongo2.Context{
		"url":     url,
		"message": message,
	})
}
