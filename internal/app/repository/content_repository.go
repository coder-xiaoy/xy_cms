package repository

import (
	"context"
	"encoding/json"
	"gorm.io/gorm"
	"log"
	"xy_cms/internal/app/model"
)

type contentRepository struct {
	db *gorm.DB
	m  model.Content
}

func newContentRepository(db *gorm.DB) contentRepository {
	return contentRepository{db: db}
}

func (c *contentRepository) WithContext(ctx context.Context) contentRepository {
	return newContentRepository(c.db.WithContext(ctx))
}

func (c *contentRepository) GetContentByCategoryId(categoryId uint64) ([]map[string]interface{}, error) {
	var res []map[string]interface{}
	var category model.Category
	err := c.db.Where("id = ?", categoryId).Preload("CategoryModel.ModelFields").First(&category).Error
	if err != nil {
		return res, err
	}
	err1 := c.db.Table(c.m.TableName()).Where("catid = ?", categoryId).Joins(
		"LEFT JOIN " + category.CategoryModel.ModelTable + " as ExtentContent ON ExtentContent.contentid = content.contentid",
	).Select("*").Find(&res).Error
	var arrContent []model.ContentWithMore
	for _, v := range res {
		jsonString, _ := json.Marshal(v)
		extentMore := model.ContentWithMore{ExtendContent: make(map[string]interface{})}
		json.Unmarshal(jsonString, &extentMore)
		for _, field := range category.CategoryModel.ModelFields {
			if _, ok := v[field.Field]; ok {
				extentMore.ExtendContent[field.Field] = v[field.Field]
			}
		}
		arrContent = append(arrContent, extentMore)
	}
	//fmt.Println(arrContent)
	if err1 != nil {
		log.Println(err1)
		return res, err
	}
	return res, err1
}

func (c *contentRepository) GetContentByContentId(id int32) (model.Content, error) {
	var content model.Content
	err := c.db.Where("contentid = ?", id).First(&content).Error
	return content, err
}
func (c *contentRepository) GetMoreContetnByContentId(contentId int64, tableName string) (map[string]interface{}, error) {
	res := map[string]interface{}{}
	err := c.db.Table(tableName).Where("contentid=?", contentId).Take(&res).Error
	return res, err
}

func (c *contentRepository) GetContentCountWithCategory() ([]model.ContentCountWithCategory, error) {
	var countWithCategory []model.ContentCountWithCategory
	err := c.db.Group("catid").Select("catid,count(*) as total").Model(&model.Content{}).Find(&countWithCategory).Error
	return countWithCategory, err
}
