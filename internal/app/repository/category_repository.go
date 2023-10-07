package repository

import (
	"context"
	"gorm.io/gorm"
	"xy_cms/internal/app/model"
)

type categoryRepository struct {
	db *gorm.DB
}

func newCategoryRepository(db *gorm.DB) categoryRepository {
	return categoryRepository{db: db}
}
func (r *categoryRepository) WithContext(ctx context.Context) categoryRepository {
	return newCategoryRepository(r.db.WithContext(ctx))
}

func (r *categoryRepository) GetCategoryByCategoryId(categoryID int64) (model.Category, error) {
	var category model.Category
	err := r.db.Where("id = ?", categoryID).Preload("CategoryModel.ModelFields").First(&category).Error
	return category, err
}
func (r *categoryRepository) Save(category *model.Category) bool {
	err := r.db.Create(category).Error
	if err != nil {
		return false
	} else {
		return true
	}
}
func (r *categoryRepository) GetAll() ([]model.Category, error) {
	var categoryList []model.Category
	err := r.db.Joins("CategoryModel").Find(&categoryList).Error
	return categoryList, err
}
