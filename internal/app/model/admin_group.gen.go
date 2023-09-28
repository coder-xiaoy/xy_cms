package model

const TableNameAdminGroup = "admin_group"

// AdminGroup mapped from table <admin_group>
type AdminGroup struct {
	ID   int32  `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	Name string `gorm:"column:name;not null" json:"name"`
}

// TableName AdminGroup's table name
func (*AdminGroup) TableName() string {
	return TableNameAdminGroup
}
