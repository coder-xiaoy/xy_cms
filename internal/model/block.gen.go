package model

const TableNameBlock = "block"

// Block mapped from table <block>
type Block struct {
	ID      int32  `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	Title   string `gorm:"column:title;not null" json:"title"`
	Tag     string `gorm:"column:tag;not null" json:"tag"`
	Content string `gorm:"column:content;not null" json:"content"`
}

// TableName Block's table name
func (*Block) TableName() string {
	return TableNameBlock
}
