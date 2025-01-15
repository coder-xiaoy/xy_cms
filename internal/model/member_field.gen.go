package model

const TableNameMemberField = "member_field"

// MemberField mapped from table <member_field>
type MemberField struct {
	Fieldid    int32  `gorm:"column:fieldid;primaryKey;autoIncrement:true" json:"fieldid"`
	Field      string `gorm:"column:field;not null" json:"field"`
	Name       string `gorm:"column:name;not null" json:"name"`
	Formtype   string `gorm:"column:formtype;not null" json:"formtype"`
	Width      int32  `gorm:"column:width;not null" json:"width"`
	Height     int32  `gorm:"column:height;not null" json:"height"`
	Initial    string `gorm:"column:initial" json:"initial"`
	Explain    string `gorm:"column:explain" json:"explain"`
	Sort       int32  `gorm:"column:sort;not null" json:"sort"`
	IsFixed    bool   `gorm:"column:is_fixed;not null" json:"is_fixed"`
	IsRegister bool   `gorm:"column:is_register;not null" json:"is_register"`
}

// TableName MemberField's table name
func (*MemberField) TableName() string {
	return TableNameMemberField
}
