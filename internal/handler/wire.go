//go:build wireinject
// +build wireinject

package handler

import (
	"github.com/google/wire"
	"xy_cms/internal/service"
)

func NewHandler() (*Handler, error) {
	wire.Build(
		service.ServiceSet,
		HandlerSet,
		wire.Struct(new(Handler), "*"),
	)
	return &Handler{}, nil
}
