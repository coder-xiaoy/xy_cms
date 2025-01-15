package service

import (
	"xy_cms/internal/model"
	"xy_cms/internal/repository"
)

type modelMService struct {
}

func newModelMService() modelMService {
	return modelMService{}
}
func (s modelMService) GetList() ([]model.ModelM, error) {
	return repository.ModelMRepository.GetList()
}
