package repository

import (
	"context"
	"gorm.io/gorm"
	"xy_cms/internal/model"
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

func (r modelMRepository) WithContext(ctx context.Context) modelMRepository {
	r.db = r.db.WithContext(ctx)
	return r
}
