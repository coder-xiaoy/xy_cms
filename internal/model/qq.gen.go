package model

const TableNameQq = "qq"

// Qq mapped from table <qq>
type Qq struct {
	ID        int32  `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	Title     string `gorm:"column:title;not null" json:"title"`
	Qq        string `gorm:"column:qq;not null" json:"qq"`
	IsLock    bool   `gorm:"column:is_lock;not null" json:"is_lock"`
	Inputtime int32  `gorm:"column:inputtime;not null" json:"inputtime"`
}

// TableName Qq's table name
func (*Qq) TableName() string {
	return TableNameQq
}
