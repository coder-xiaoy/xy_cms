package repository

import (
	"context"
	"gorm.io/gorm"
	"xy_cms/internal/app/model"
)

type configRepository struct {
	db *gorm.DB
}

func newConfigRepository(db *gorm.DB) configRepository {
	return configRepository{db: db}
}
func (r *configRepository) WithContext(ctx context.Context) configRepository {
	return newConfigRepository(r.db.WithContext(ctx))
}
func (r *configRepository) GetConfigByTag(tag string) (model.Config, error) {
	config := model.Config{}
	err := r.db.Where("config_tag = ?", tag).First(&config).Error
	return config, err
}
func (r *configRepository) UpdateConfigByTag(tag string, config string) error {
	err := r.db.Model(model.Config{}).Where("config_tag = ?", tag).Update("config_array", config).Error
	return err
}
