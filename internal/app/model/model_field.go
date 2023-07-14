package model

type ModelField struct {
	FieldId  uint32 `gorm:"column:fieldid"`
	ModelId  uint8  `gorm:"column:modelid"`
	Field    string `gorm:"column:field"`
	Name     string `gorm:"column:name"`
	FormType string `gorm:"column:formtype"`
	Width    int8   `gorm:"column:width"`
	Height   int8   `gorm:"column:height"`
	Initial  string `gorm:"column:initial"`
	Explain  string `gorm:"column:explain"`
	Sort     uint32 `gorm:"column:sort"`
	IsFixed  uint8  `gorm:"column:is_fixed"`
}

func (m *ModelField) TableName() string {
	return "model_field"
}
