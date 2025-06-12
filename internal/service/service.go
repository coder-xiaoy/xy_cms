package service

import (
	"fmt"
	"github.com/google/wire"
	"sync"
)

var ServiceSet = wire.NewSet(
	 
	NewCategoryServiceImpl,
)

var syncOnce sync.Once

var (
	S               = new(service)
	ContentService  *contentService
	ModelMService   *modelMService
	CategoryService *categoryService
	ConfigService   *configService
	TemplateService *templateService
)

func init() {
	syncOnce.Do(func() {
		setDefault()
	})
}

func setDefault() {
	S = newService()
	fmt.Println("service init")
	ContentService = &S.contentService
	ModelMService = &S.modelMService
	CategoryService = &S.categoryService
	ConfigService = &S.configService
	TemplateService = &S.templateService

}

func newService() *service {
	return &service{
		contentService:  newContentService(),
		modelMService:   newModelMService(),
		categoryService: newCategoryService(),
		configService:   newConfigService(),
		templateService: newTemplateService(),
	}
}

type service struct {
	contentService  contentService
	modelMService   modelMService
	categoryService categoryService
	configService   configService
	templateService templateService
}
