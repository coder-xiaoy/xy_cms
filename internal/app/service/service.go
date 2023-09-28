package service

import (
	"fmt"
	"sync"
)

var syncOnce sync.Once

var (
	S               = new(service)
	ContentService  *contentService
	ModelMService   *modelMService
	CategoryService *categoryService
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

}

func newService() *service {
	return &service{
		contentService:  newContentService(),
		modelMService:   newModelMService(),
		categoryService: newCategoryService(),
	}
}

type service struct {
	contentService  contentService
	modelMService   modelMService
	categoryService categoryService
}
