package service

import (
	"golang.org/x/exp/slog"
	"gorm.io/gorm"
	"xy_cms/internal/dal/gen_model"
	"xy_cms/internal/dal/query"
	"xy_cms/internal/request"
	"xy_cms/internal/utils"
)

type ICategoryService interface {
	SaveCategory(gen_model.Category) (int64, error)
	GetCategoryById(int64) (*gen_model.Category, error)
	GetCategoryList(pageRequest request.PageRequest) (*utils.Paginator[[]*gen_model.Category], error)
}

func NewCategoryServiceImpl() ICategoryService {
	return &categoryServiceImpl{}
}

var _ ICategoryService = (*categoryServiceImpl)(nil)

type categoryServiceImpl struct {
}

func (c *categoryServiceImpl) GetCategoryList(pageRequest request.PageRequest) (*utils.Paginator[[]*gen_model.Category], error) {
	var TotalCount int64
	categoryList, TotalCount, err := query.Category.Select(query.Category.ALL).FindByPage(pageRequest.GetOffset(), pageRequest.PageSize)
	if err != nil {
		slog.Error(err.Error())
		return nil, err
	} else {
		paginator := utils.NewPaginator[[]*gen_model.Category](TotalCount, int64(pageRequest.Page), int64(pageRequest.PageSize))
		paginator.Result = categoryList
		return paginator, nil
	}
}

func (c *categoryServiceImpl) SaveCategory(category gen_model.Category) (int64, error) {
	err := query.Category.Save(&category)
	if err != nil {
		return 0, err
	}
	return category.ID, nil
}

func (c *categoryServiceImpl) GetCategoryById(id int64) (*gen_model.Category, error) {
	category := query.Q.Category
	return category.Where(category.ID.Eq(id)).First()
}
func (c *categoryServiceImpl) UpdateCategoryById(categoryRequest request.CategoryRequest, id int64, tx *gorm.DB) (int64, error) {
	query.Q.WithContext(tx.Statement.Context)
	panic("implement me")
}
