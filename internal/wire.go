// wire.go
//go:build wireinject
// +build wireinject

package internal

import (
	"xy_cms/internal/controller/admin"
	"xy_cms/internal/service"
)
import "github.com/google/wire"

func InitializeCategoryControllerV2() admin.CategoryControllerV2 {
	wire.Build(admin.NewCategoryControllerV2, service.NewCategoryServiceImpl)
	return admin.CategoryControllerV2{}
}
