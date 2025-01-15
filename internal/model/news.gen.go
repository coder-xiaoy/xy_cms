package model

const TableNameNews = "news"

// News mapped from table <news>
type News struct {
	Contentid int32  `gorm:"column:contentid;not null" json:"contentid"`
	Content   string `gorm:"column:content;not null" json:"content"`
}

// TableName News's table name
func (*News) TableName() string {
	return TableNameNews
}
