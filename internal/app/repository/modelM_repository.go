package repository

import (
	"gorm.io/gorm"
	"xy_cms/internal/app/model"
)

type modelMRepository struct {
	db *gorm.DB
}

func newModelMRepository(db *gorm.DB) modelMRepository {
	return modelMRepository{db: db}
}

func (r modelMRepository) GetModelMByModelId(modelID int64) (model.ModelM, error) {
	var modelM model.ModelM
	err := r.db.Where("id = ?", modelID).Preload("ModelFields").First(&modelM).Error
	return modelM, err
}
func (r modelMRepository) GetList() ([]model.ModelM, error) {
	var arrModelM []model.ModelM
	err := r.db.Find(&arrModelM).Error
	return arrModelM, err
}
