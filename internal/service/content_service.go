package service

import (
	"context"
	"log"
	"xy_cms/internal/model"
	"xy_cms/internal/repository"
	"xy_cms/internal/utils"
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
	moreContent, err := repository.ContentRepository.GetMoreContentByContentId(int64(contentID), modelM.ModelTable)
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
func (s *contentService) GetContentListByCategoryId(ctx context.Context, catId int64, page int64, pageSize int64) (*utils.Paginator[[]model.Content], error) {
	count, err := repository.ContentRepository.WithContext(ctx).GetAllContentCountByContentIds([]int64{catId})
	if err != nil {
		return nil, err
	}
	var paginator = utils.NewPaginator[[]model.Content](count, page, pageSize)

	if count != 0 {
		result, resErr := repository.ContentRepository.WithContext(ctx).GetAllContentWithPageByContentIds([]int64{catId}, int((page-1)*pageSize), int(pageSize))
		if resErr != nil {
			return paginator, resErr
		}
		paginator.Result = result
	}
	return paginator, nil
}
