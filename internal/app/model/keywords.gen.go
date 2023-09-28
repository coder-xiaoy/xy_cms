package model

const TableNameKeyword = "keywords"

// Keyword mapped from table <keywords>
type Keyword struct {
	ID    int32  `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	Title string `gorm:"column:title;not null" json:"title"`
	URL   string `gorm:"column:url;not null" json:"url"`
}

// TableName Keyword's table name
func (*Keyword) TableName() string {
	return TableNameKeyword
}
