package service

import (
	"xy_cms/internal/app/model"
	"xy_cms/internal/app/repository"
)

type modelMService struct {
}

func newModelMService() modelMService {
	return modelMService{}
}
func (s modelMService) GetList() ([]model.ModelM, error) {
	return repository.ModelMRepository.GetList()
}
