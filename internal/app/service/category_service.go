package service

import (
	"context"
	"errors"
	"github.com/jinzhu/copier"
	"gorm.io/gorm"
	"log"
	"xy_cms/internal/app/model"
	"xy_cms/internal/app/repository"
	"xy_cms/internal/app/request"
	"xy_cms/internal/app/utils"
)

type categoryService struct {
}

func newCategoryService() categoryService {
	return categoryService{}
}

func (receiver *categoryService) GetCategoryById(id int64) (model.Category, error) {
	result, err := repository.CategoryRepository.GetCategoryByCategoryId(id)
	if err != nil {
		log.Print("err:" + err.Error())
	}
	return result, err
}

func (receiver *categoryService) UpdateByCategoryId(ctx context.Context, categoryRequest request.CategoryRequest, id int64) bool {
	ctx.Deadline()
	err := repository.Q.Transaction(ctx, func(tx *gorm.DB) error {
		modelM, err := repository.ModelMRepository.GetModelMByModelId(categoryRequest.ModelID)
		if err != nil {
			return err
		}
		var category = &model.Category{}
		err = copier.Copy(category, &categoryRequest)
		if err != nil {
			return err
		}
		category.Model = modelM.ModelTable
		result := repository.CategoryRepository.UpdateById(category, id)
		if result {
			return nil
		} else {
			return errors.New("update failed")
		}
	})
	if err != nil {
		return false
	}
	if err != nil {
		return true
	}
	return false

}

func (receiver *categoryService) Save(categoryRequest request.CategoryRequest) bool {
	modelM, err := repository.ModelMRepository.GetModelMByModelId(categoryRequest.ModelID)
	if err != nil {
		return false
	}
	var category = &model.Category{}
	err = copier.Copy(category, &categoryRequest)
	if err != nil {
		return false
	}

	category.Model = modelM.ModelTable

	return repository.CategoryRepository.Save(category)
}
func (receiver *categoryService) GetAll() []model.Category {
	categoryList, err := repository.CategoryRepository.GetAll()
	if err != nil {
		log.Print("err:" + err.Error())
	}
	return categoryList
}

func (receiver *categoryService) GetAllTree() []model.Category {
	categoryList := receiver.GetAll()
	return receiver.buildTree(0, categoryList)

}

func (receiver *categoryService) GetAllDeep() []model.Category {
	categoryList := receiver.GetAllTree()
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
