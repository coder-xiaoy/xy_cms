package model

type CategoryRelationship struct {
	ID            int64 `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	CategoryId    int64 `gorm:"column:category_id;not null" json:"category_id"`
	SubCategoryId int64 `gorm:"column:sub_category_id;not null" json:"sub_category_id"`
	Deep          int32 `gorm:"column:deep;not null;default 0" json:"deep"`
}
