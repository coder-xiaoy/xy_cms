package model

const TableNameFlash = "flash"

// Flash mapped from table <flash>
type Flash struct {
	ID        int32  `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	Title     string `gorm:"column:title;not null" json:"title"`
	URL       string `gorm:"column:url;not null" json:"url"`
	Thumb     string `gorm:"column:thumb;not null" json:"thumb"`
	IsLock    bool   `gorm:"column:is_lock;not null" json:"is_lock"`
	Type      int32  `gorm:"column:type;not null;default:1" json:"type"`
	Sort      int32  `gorm:"column:sort;not null" json:"sort"`
	Inputtime int32  `gorm:"column:inputtime;not null" json:"inputtime"`
	Catid     int32  `gorm:"column:catid;not null" json:"catid"`
}

// TableName Flash's table name
func (*Flash) TableName() string {
	return TableNameFlash
}
