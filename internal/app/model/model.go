package model

type Model struct {
	ID          uint32       `gorm:"column:id"`
	ModelName   string       `gorm:"column:model_name"`
	ModelTable  string       `gorm:"column:model_table"`
	IsLock      uint8        `gorm:"column:is_lock"`
	IsFixed     uint8        `gorm:"column:is_fixed"`
	ModelFields []ModelField `gorm:"foreignKey:ModelId" gorm:"references:ID"`
}

func (model *Model) TableName() string {
	return "model"
}
