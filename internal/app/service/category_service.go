package service

import (
	"log"
	"xy_cms/internal/app/model"
	"xy_cms/internal/app/repository"
)

type categoryService struct {
}

func newCategoryService() categoryService {
	return categoryService{}
}

func (receiver *categoryService) GetCategoryById(id int64) (model.Category, error) {
	result, err := repository.CategoryRepository.GetCategoryByCategoryId(id)
	if err != nil {
		log.Print("err:" + err.Error())
	}
	return result, err
}

func (receiver *categoryService) Save() *model.Category {
	var category = &model.Category{}
	repository.CategoryRepository.Save(category)
	return category
}
