package repository

import (
	"gorm.io/gorm"
	"xy_cms/internal/app/model"
)

type ModelRepository struct {
	db *gorm.DB
	m  model.Model
}

func NewModelRepository(db *gorm.DB) *ModelRepository {
	return &ModelRepository{db: db}
}
func (m *ModelRepository) FindModelById(id uint32) (model.Model, error) {
	var res model.Model
	err := m.db.Where("id = ?", id).Preload("ModelFields").First(&res).Error
	return res, err
}
func (m *ModelRepository) GetModelAll() ([]model.Model, error) {
	var res []model.Model
	err := m.db.Preload("ModelFields").Find(&res).Error
	return res, err
}
