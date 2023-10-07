package model

type ContentCountWithCategory struct {
	Catid int64 `gorm:"catid" json:"cat_id"`
	Total int64 `gorm:"total" json:"total"`
}
