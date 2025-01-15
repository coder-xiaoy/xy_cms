package model

const TableNameMigration = "migration"

// Migration mapped from table <migration>
type Migration struct {
	Version   string `gorm:"column:version;primaryKey" json:"version"`
	ApplyTime int32  `gorm:"column:apply_time" json:"apply_time"`
}

// TableName Migration's table name
func (*Migration) TableName() string {
	return TableNameMigration
}
