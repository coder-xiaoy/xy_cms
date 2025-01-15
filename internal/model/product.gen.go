package model

const TableNameProduct = "product"

// Product mapped from table <product>
type Product struct {
	Contentid int32  `gorm:"column:contentid;not null" json:"contentid"`
	Content   string `gorm:"column:content;not null" json:"content"`
	Moreimage string `gorm:"column:moreimage;not null" json:"moreimage"`
}

// TableName Product's table name
func (*Product) TableName() string {
	return TableNameProduct
}
