package repository

import (
	"context"
	"gorm.io/gorm"
	"xy_cms/internal/model"
)

type modelRepository struct {
	db *gorm.DB
	m  model.ModelM
}

func newModelRepository(db *gorm.DB) modelRepository {
	return modelRepository{db: db}
}
func (m modelRepository) WithContext(ctx context.Context) modelRepository {
	m.db = m.db.WithContext(ctx)
	return m
}
func (m *modelRepository) FindModelById(id uint32) (model.ModelM, error) {
	var res model.ModelM
	err := m.db.Where("id = ?", id).Preload("ModelFields").First(&res).Error
	return res, err
}
func (m *modelRepository) GetModelAll() ([]model.ModelM, error) {
	var res []model.ModelM
	err := m.db.Preload("ModelFields").Find(&res).Error
	return res, err
}
