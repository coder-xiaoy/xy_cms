package handler

import (
	"github.com/google/wire"
	v1 "xy_cms/internal/handler/v1"
)

var HandlerSet = wire.NewSet(
	v1.NewCategoryHandler,
)

type Handler struct {
	Category *v1.CategoryHandler
}

var Handle *Handler
