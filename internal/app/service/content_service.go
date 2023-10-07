package service

import (
	"log"
	"xy_cms/internal/app/model"
	"xy_cms/internal/app/repository"
)

type contentService struct {
}

func newContentService() contentService {
	return contentService{}
}
func (s *contentService) GetContentByContentId(contentID int32) (model.ContentWithMore, error) {
	var contentWithMore model.ContentWithMore
	var err error

	content, err := repository.ContentRepository.GetContentByContentId(contentID)
	if err != nil {
		return contentWithMore, err
	}
	category, err := repository.CategoryRepository.GetCategoryByCategoryId(content.Catid)
	if err != nil {
		return contentWithMore, err
	}

	modelM, err := repository.ModelMRepository.GetModelMByModelId(int64(category.ModelID))
	if err != nil {
		return contentWithMore, err
	}
	moreContent, err := repository.ContentRepository.GetMoreContetnByContentId(int64(contentID), modelM.ModelTable)
	if err != nil {
		return contentWithMore, err
	}
	for _, field := range modelM.ModelFields {
		if _, ok := moreContent[field.Field]; !ok {
			delete(moreContent, field.Field)
		}
	}
	contentWithMore = model.ContentWithMore{
		ExtendContent: moreContent,
		Content:       content,
	}
	return contentWithMore, nil
}
func (s *contentService) GetContentCountWithCategory() ([]model.ContentCountWithCategory, error) {
	res, err := repository.ContentRepository.GetContentCountWithCategory()
	if err != nil {
		log.Print("err:", err)
	}
	return res, err
}
