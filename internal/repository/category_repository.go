package repository

import (
	"context"
	"gorm.io/gorm"
	"log"
	"xy_cms/internal/model"
)

type categoryRepository struct {
	db *gorm.DB
}

func newCategoryRepository(db *gorm.DB) categoryRepository {

	return categoryRepository{db: db}
}
func (c categoryRepository) WithContext(ctx context.Context) categoryRepository {
	c.db = c.db.WithContext(ctx)
	return c
}

func (c categoryRepository) clone(db *gorm.DB) categoryRepository {
	c.db = c.db.Session(&gorm.Session{Initialized: true}).Session(&gorm.Session{})
	c.db.Statement.ConnPool = db.Statement.ConnPool
	return c
}

func (c categoryRepository) GetCategoryByCategoryId(categoryID int64) (model.Category, error) {
	var category model.Category
	err := c.db.Where("id = ?", categoryID).Preload("CategoryModel.ModelFields").First(&category).Error
	return category, err
}
func (c categoryRepository) Save(category *model.Category) (bool, error) {
	err := c.db.Create(category).Error
	if err != nil {
		return false, err
	} else {
		return true, nil
	}
}
func (c categoryRepository) UpdateById(category *model.Category, id int64) bool {
	err := c.db.Model(&category).Where("id=?", id).Updates(category).Error
	if err != nil {
		log.Println(err)
		return false
	} else {
		return true
	}
}

func (c categoryRepository) GetAll() ([]model.Category, error) {
	var categoryList []model.Category
	err := c.db.Joins("CategoryModel").Find(&categoryList).Error
	return categoryList, err
}
func (c categoryRepository) DeleteById(id int64) error {
	err := c.db.Delete(&model.Category{}, id).Error
	return err
}

func (c categoryRepository) GetChildCountById(id int64) (int64, error) {
	var count int64
	err := c.db.Model(&model.Category{}).Where("parent_id=?", id).Count(&count).Error
	return count, err
}
func (c categoryRepository) SaveCategoryRelationship(categoryRelationship []model.CategoryRelationship) error {
	return c.db.CreateInBatches(categoryRelationship, 100).Error
}

func (c categoryRepository) DeleteCategoryRelationships(categoryId int64) error {
	err := c.db.
		Where(
			c.db.
				Where("category_id = ?", categoryId).
				Or("sub_category_id = ?", categoryId),
		).
		Delete(&model.CategoryRelationship{}).
		Error
	return err
}
