package repository

import (
	"context"
	"gorm.io/gorm"
)

var (
	Q                  = new(Query)
	ContentRepository  *contentRepository
	ModelRepository    *modelRepository
	CategoryRepository *categoryRepository
	ModelMRepository   *modelMRepository
	ConfigRepository   *configRepository
)

func SetDefault(db *gorm.DB) {
	Q = Use(db)
	ContentRepository = &Q.ContentRepository
	ModelRepository = &Q.ModelRepository
	CategoryRepository = &Q.CategoryRepository
	ModelMRepository = &Q.ModelMRepository
	ConfigRepository = &Q.ConfigRepository
}

func Use(db *gorm.DB) *Query {
	return &Query{
		db:                 db,
		ContentRepository:  newContentRepository(db),
		ModelRepository:    newModelRepository(db),
		CategoryRepository: newCategoryRepository(db),
		ModelMRepository:   newModelMRepository(db),
		ConfigRepository:   newConfigRepository(db),
	}
}

type QueryCtx struct {
	ContentRepository  contentRepository
	ModelRepository    modelRepository
	CategoryRepository categoryRepository
	ModelMRepository   modelMRepository
	ConfigRepository   configRepository
}
type Query struct {
	db                 *gorm.DB
	ContentRepository  contentRepository
	ModelRepository    modelRepository
	CategoryRepository categoryRepository
	ModelMRepository   modelMRepository
	ConfigRepository   configRepository
}

func (q *Query) Transaction(f func(query *Query) error) error {

	return q.db.Transaction(func(tx *gorm.DB) error {
		return f(q.clone(tx))
	})
}
func (q *Query) WithContext(ctx context.Context) *QueryCtx {
	return &QueryCtx{
		ContentRepository:  q.ContentRepository.WithContext(ctx),
		ModelRepository:    q.ModelRepository.WithContext(ctx),
		CategoryRepository: q.CategoryRepository.WithContext(ctx),
		ModelMRepository:   q.ModelMRepository.WithContext(ctx),
		ConfigRepository:   q.ConfigRepository.WithContext(ctx),
	}
}

func (q *Query) clone(db *gorm.DB) *Query {
	return &Query{
		db:                 db,
		ContentRepository:  newContentRepository(db),
		ModelRepository:    newModelRepository(db),
		CategoryRepository: newCategoryRepository(db),
		ModelMRepository:   newModelMRepository(db),
		ConfigRepository:   newConfigRepository(db),
	}
}
