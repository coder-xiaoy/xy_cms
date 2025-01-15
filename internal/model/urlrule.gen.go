package model

const TableNameUrlrule = "urlrule"

// Urlrule mapped from table <urlrule>
type Urlrule struct {
	ID      int32  `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	Class   string `gorm:"column:class;not null" json:"class"`
	Ishtml  bool   `gorm:"column:ishtml;not null" json:"ishtml"`
	Urldemo string `gorm:"column:urldemo;not null" json:"urldemo"`
	URL     string `gorm:"column:url;not null" json:"url"`
	IsFixed bool   `gorm:"column:is_fixed;not null" json:"is_fixed"`
}

// TableName Urlrule's table name
func (*Urlrule) TableName() string {
	return TableNameUrlrule
}
