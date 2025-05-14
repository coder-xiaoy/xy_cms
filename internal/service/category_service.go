package service

import (
	"context"
	"errors"
	"github.com/jinzhu/copier"
	"log"
	"xy_cms/internal/dal/query"
	errors2 "xy_cms/internal/errors"
	"xy_cms/internal/model"
	"xy_cms/internal/repository"
	"xy_cms/internal/request"
	"xy_cms/internal/utils"
)

type categoryService struct {
}

func newCategoryService() categoryService {
	return categoryService{}
}

func (receiver *categoryService) GetCategoryById(id int64, ctx context.Context) (category model.Category, err error) {
	err = query.Q.Category.WithContext(ctx).Where(query.Category.ID.Eq(id)).Scan(&category)
	if err != nil {
		log.Print("err:" + err.Error())
	}
	return
}

func (receiver *categoryService) UpdateByCategoryId(ctx context.Context, categoryRequest request.CategoryRequest, id int64) bool {
	err := repository.Q.Transaction(func(query *repository.Query) error {
		modelM, err := query.ModelMRepository.WithContext(ctx).GetModelMByModelId(categoryRequest.ModelID)
		if err != nil {
			return err
		}
		var category = &model.Category{}
		err = copier.Copy(category, &categoryRequest)
		if err != nil {
			return err
		}
		category.Model = modelM.ModelTable
		result := query.CategoryRepository.WithContext(ctx).UpdateById(category, id)
		if result {
			return nil
		} else {
			return errors.New("update failed")
		}
	})
	if err != nil {
		return false
	}
	return true

}

func (receiver *categoryService) Save(categoryRequest request.CategoryRequest) (bool, error) {
	modelM, err := repository.ModelMRepository.GetModelMByModelId(categoryRequest.ModelID)
	if err != nil {
		return false, err
	}
	var category = &model.Category{}
	err = copier.Copy(category, &categoryRequest)
	if err != nil {
		return false, err
	}

	category.Model = modelM.ModelTable

	return repository.CategoryRepository.Save(category)
}
func (receiver *categoryService) GetAll(ctx context.Context) []model.Category {
	categoryList, err := repository.CategoryRepository.WithContext(ctx).GetAll()
	if err != nil {
		log.Print("err:" + err.Error())
	}
	return categoryList
}

func (receiver *categoryService) GetAllTree(ctx context.Context) []model.Category {
	categoryList := receiver.GetAll(ctx)
	return receiver.buildTree(0, categoryList)

}

func (receiver *categoryService) GetAllDeep(ctx context.Context) []model.Category {
	categoryList := receiver.GetAllTree(ctx)
	return receiver.treeToDeepList(0, categoryList)
}

func (receiver *categoryService) buildTree(p int64, list []model.Category) []model.Category {
	var res []model.Category
	for _, v := range list {
		category := v
		if v.ParentID == p {
			category.Children = receiver.buildTree(category.ID, list)
			res = append(res, category)
		}
	}
	return res
}

func (receiver *categoryService) treeToDeepList(deep int, list []model.Category) []model.Category {
	var res []model.Category
	preFix := ""
	if deep > 0 {
		preFix = utils.StrPadRight("├", deep+2, "-")
	}
	for _, v := range list {
		category := v
		category.CatName = preFix + category.CatName
		res = append(res, category)
		if len(category.Children) > 0 {
			res = append(res, receiver.treeToDeepList(deep+1, category.Children)...)
			category.Children = nil
		}

	}
	return res
}

func (receiver *categoryService) DeleteCategoryByID(ctx context.Context, id int64) error {
	return repository.Q.Transaction(func(query *repository.Query) error {
		count, err := query.ContentRepository.WithContext(ctx).GetContentCountByCategoryId(id)
		if err != nil {
			return err
		}
		if count > 0 {
			return errors2.NewErrorServices("栏目中包含内容，无法删除")
		}
		count, err = query.CategoryRepository.GetChildCountById(id)
		if err != nil {
			return err
		}
		if count > 0 {
			return errors2.NewErrorServices("栏目中包含子栏目，无法删除")
		}

		err = query.CategoryRepository.WithContext(ctx).DeleteById(id)
		return err
	})

}
