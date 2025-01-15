package model

const TableNameForm = "form"

// Form mapped from table <form>
type Form struct {
	ID        int32  `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	FormName  string `gorm:"column:form_name;not null" json:"form_name"`
	FormTable string `gorm:"column:form_table;not null" json:"form_table"`
	IsLock    bool   `gorm:"column:is_lock;not null" json:"is_lock"`
	IsFixed   bool   `gorm:"column:is_fixed;not null" json:"is_fixed"`
	IsEmail   bool   `gorm:"column:is_email;not null" json:"is_email"`
	IsCode    bool   `gorm:"column:is_code;not null" json:"is_code"`
}

// TableName Form's table name
func (*Form) TableName() string {
	return TableNameForm
}
