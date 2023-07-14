package repository

import (
	"gorm.io/gorm"
	"xy_cms/internal/app/model"
)

type ContentRepository struct {
	db *gorm.DB
	m  model.Content
}

func NewContentRepository(db *gorm.DB) *ContentRepository {
	return &ContentRepository{db: db}
}
func (c *ContentRepository) GetContentByCategoryId(categoryId uint64) ([]model.Content, error) {
	var res []model.Content
	var category model.Category
	err := c.db.Where("id = ?", categoryId).Preload("CategoryModel.ModelFields").First(&category).Error
	if err != nil {
		return res, err
	}

	err1 := c.db.Where("catid = ?", categoryId).Joins(
		"LEFT JOIN " + category.CategoryModel.ModelTable + " as ExtentContent ON ExtentContent.contentid = content.contentid",
	).Select("content.*,ExtentContent.contentid as ExtentContent__contentid").Find(&res).Error
	if err1 != nil {
		return res, err
	}

	return res, err1
}
