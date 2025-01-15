package model

const TableNameLink = "link"

// Link mapped from table <link>
type Link struct {
	ID        int32  `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	Title     string `gorm:"column:title;not null" json:"title"`
	URL       string `gorm:"column:url;not null" json:"url"`
	IsLock    bool   `gorm:"column:is_lock;not null" json:"is_lock"`
	Inputtime int32  `gorm:"column:inputtime;not null" json:"inputtime"`
}

// TableName Link's table name
func (*Link) TableName() string {
	return TableNameLink
}
