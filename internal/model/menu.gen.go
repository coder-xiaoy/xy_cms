package model

const TableNameMenu = "menu"

// Menu mapped from table <menu>
type Menu struct {
	Menuid   int32  `gorm:"column:menuid;primaryKey;autoIncrement:true" json:"menuid"`
	Parentid int32  `gorm:"column:parentid;not null" json:"parentid"`
	Title    string `gorm:"column:title;not null" json:"title"`
	URL      string `gorm:"column:url;not null" json:"url"`
	Sort     int32  `gorm:"column:sort" json:"sort"`
	IsShow   int32  `gorm:"column:is_show;not null;default:1" json:"is_show"`
	Groupid  string `gorm:"column:groupid;not null" json:"groupid"`
}

// TableName Menu's table name
func (*Menu) TableName() string {
	return TableNameMenu
}
