package model

const TableNameModel = "model"

// ModelM Model mapped from table <model>
type ModelM struct {
	ID          int32        `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	ModelName   string       `gorm:"column:model_name;not null" json:"model_name"`
	ModelTable  string       `gorm:"column:model_table;not null" json:"model_table"`
	IsLock      bool         `gorm:"column:is_lock;not null" json:"is_lock"`
	IsFixed     bool         `gorm:"column:is_fixed;not null" json:"is_fixed"`
	ModelFields []ModelField `gorm:"foreignKey:modelid;references:id" json:"model_fields"`
}

// TableName Model's table name
func (*ModelM) TableName() string {
	return TableNameModel
}
