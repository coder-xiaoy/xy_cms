package model

const TableNameSingle = "single"

// Single mapped from table <single>
type Single struct {
	Contentid int32  `gorm:"column:contentid;not null" json:"contentid"`
	Content   string `gorm:"column:content;not null" json:"content"`
}

// TableName Single's table name
func (*Single) TableName() string {
	return TableNameSingle
}
