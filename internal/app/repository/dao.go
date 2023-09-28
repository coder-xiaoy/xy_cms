package repository

import "gorm.io/gorm"

var (
	Q                  = new(Query)
	ContentRepository  *contentRepository
	ModelRepository    *modelRepository
	CategoryRepository *categoryRepository
	ModelMRepository   *modelMRepository
)

func SetDefault(db *gorm.DB) {
	Q = Use(db)
	ContentRepository = &Q.contentRepository
	ModelRepository = &Q.modelRepository
	CategoryRepository = &Q.categoryRepository
	ModelMRepository = &Q.modelMRepository
}

func Use(db *gorm.DB) *Query {
	return &Query{
		db:                 db,
		contentRepository:  newContentRepository(db),
		modelRepository:    newModelRepository(db),
		categoryRepository: newCategoryRepository(db),
		modelMRepository:   newModelMRepository(db),
	}
}

type Query struct {
	db                 *gorm.DB
	contentRepository  contentRepository
	modelRepository    modelRepository
	categoryRepository categoryRepository
	modelMRepository   modelMRepository
}
