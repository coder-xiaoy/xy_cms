package model

const TableNameFormField = "form_field"

// FormField mapped from table <form_field>
type FormField struct {
	Fieldid  int32  `gorm:"column:fieldid;primaryKey;autoIncrement:true" json:"fieldid"`
	Formid   int32  `gorm:"column:formid;not null" json:"formid"`
	Field    string `gorm:"column:field;not null" json:"field"`
	Name     string `gorm:"column:name;not null" json:"name"`
	Formtype string `gorm:"column:formtype;not null" json:"formtype"`
	Width    int32  `gorm:"column:width;not null" json:"width"`
	Height   int32  `gorm:"column:height;not null" json:"height"`
	Initial  string `gorm:"column:initial" json:"initial"`
	Explain  string `gorm:"column:explain" json:"explain"`
	Sort     int32  `gorm:"column:sort;not null" json:"sort"`
	IsFixed  bool   `gorm:"column:is_fixed;not null" json:"is_fixed"`
}

// TableName FormField's table name
func (*FormField) TableName() string {
	return TableNameFormField
}
