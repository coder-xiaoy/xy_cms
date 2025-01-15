package model

const TableNameMemberGroup = "member_group"

// MemberGroup mapped from table <member_group>
type MemberGroup struct {
	ID   int32  `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	Name string `gorm:"column:name;not null" json:"name"`
}

// TableName MemberGroup's table name
func (*MemberGroup) TableName() string {
	return TableNameMemberGroup
}
