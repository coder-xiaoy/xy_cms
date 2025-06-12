package service

import (
	"xy_cms/internal/dal/gen_model"
	"xy_cms/internal/dal/query"
	"xy_cms/internal/request"
	"xy_cms/internal/utils"
)

type BlockService interface {
	Create(request request.BlockRequest) bool
	GetBlockList(request.PageRequest) (*utils.Paginator[[]gen_model.Block], error)
	GetBlockContentByTag(int65 int64) string
}

type BlockServiceImpl struct {
}

func (b BlockServiceImpl) GetBlockContentByTag(int65 int64) string {
	//TODO implement me
	panic("implement me")
}

func (b BlockServiceImpl) GetBlockList(pageRequest request.PageRequest) (*utils.Paginator[[]gen_model.Block], error) {
	var total int64
	var Blocks []gen_model.Block
	offset := (pageRequest.Page - 1) * pageRequest.PageSize
	err := query.Q.Block.UnderlyingDB().
		Model(&gen_model.Block{}).
		Count(&total).
		Offset(offset).
		Limit(pageRequest.Page).
		Find(&Blocks).Error
	if err != nil {
		return nil, err
	}
	paginator := utils.NewPaginator[[]gen_model.Block](total, int64(pageRequest.Page), int64(pageRequest.PageSize))
	paginator.Result = Blocks
	return paginator, nil
}

func (b BlockServiceImpl) Create(request request.BlockRequest) bool {

	//TODO implement me
	panic("implement me")
}
