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
	ContentRepository = &Q.contentRepository
	ModelRepository = &Q.modelRepository
	CategoryRepository = &Q.categoryRepository
	ModelMRepository = &Q.modelMRepository
	ConfigRepository = &Q.configRepository
}

func Use(db *gorm.DB) *Query {
	return &Query{
		db:                 db,
		contentRepository:  newContentRepository(db),
		modelRepository:    newModelRepository(db),
		categoryRepository: newCategoryRepository(db),
		modelMRepository:   newModelMRepository(db),
		configRepository:   newConfigRepository(db),
	}
}

type Query struct {
	db                 *gorm.DB
	contentRepository  contentRepository
	modelRepository    modelRepository
	categoryRepository categoryRepository
	modelMRepository   modelMRepository
	configRepository   configRepository
}

func (q *Query) Transaction(ctx context.Context, f func(tx *gorm.DB) error) error {
	db := q.db.WithContext(ctx)
	return db.Transaction(func(tx *gorm.DB) error {
		return f(tx)
	})
}
