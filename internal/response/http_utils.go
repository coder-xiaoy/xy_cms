package response

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

type Result[T any] struct {
	Message string `json:"message"`
	Data    T      `json:"data"`
}

func Success[T any](ctx *gin.Context, message string, data T) {
	ctx.JSON(http.StatusOK, Result[T]{Message: message, Data: data})
}
