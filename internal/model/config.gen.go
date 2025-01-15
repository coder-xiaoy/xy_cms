package model

const TableNameConfig = "config"

// Config mapped from table <config>
type Config struct {
	ID          int32  `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	ConfigArray string `gorm:"column:config_array;not null" json:"config_array"`
	ConfigTag   string `gorm:"column:config_tag;not null" json:"config_tag"`
}

// TableName Config's table name
func (*Config) TableName() string {
	return TableNameConfig
}
