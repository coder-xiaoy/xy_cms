package service

import (
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

func (receiver *categoryService) Save(categoryRequest request.CategoryRequest) bool {
	modelM, err := repository.ModelMRepository.GetModelMByModelId(categoryRequest.ModelID)
	if err != nil {
		return false
	}
	var category = &model.Category{}
	category.CatName = categoryRequest.CatName
	category.Model = modelM.ModelTable
	category.Type = categoryRequest.Type
	category.ModelID = categoryRequest.ModelID
	category.ParentID = categoryRequest.ParentID
	category.CatName = categoryRequest.CatName
	category.CatDir = categoryRequest.CatDir
	category.Thumb = categoryRequest.Thumb
	category.URL = categoryRequest.URL
	category.Sort = categoryRequest.Sort
	category.IsShow = categoryRequest.IsShow
	category.IsMeshow = categoryRequest.IsMeshow
	category.IsTarget = categoryRequest.IsTarget
	category.IsHTML = categoryRequest.IsHTML
	category.IsLink = categoryRequest.IsLink
	category.TemplateCate = categoryRequest.TemplateCate
	category.TemplateList = categoryRequest.TemplateList
	category.TemplateShow = categoryRequest.TemplateShow
	category.SeoTitle = categoryRequest.SeoTitle
	category.SeoKey = categoryRequest.SeoKey
	category.SeoDes = categoryRequest.SeoDes
	category.Power = categoryRequest.Power
	category.URLList = categoryRequest.URLList
	category.URLShow = categoryRequest.URLShow

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
