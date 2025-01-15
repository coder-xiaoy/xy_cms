package model

const TableNameMember = "member"

// Member mapped from table <member>
type Member struct {
	Userid    int32  `gorm:"column:userid;primaryKey;autoIncrement:true" json:"userid"`
	Groupid   int32  `gorm:"column:groupid;not null;default:1" json:"groupid"`
	Username  string `gorm:"column:username;not null" json:"username"`
	Password  string `gorm:"column:password;not null" json:"password"`
	LastTime  int32  `gorm:"column:last_time;not null" json:"last_time"`
	CreatTime int32  `gorm:"column:creat_time;not null" json:"creat_time"`
	IsLock    int32  `gorm:"column:is_lock;not null" json:"is_lock"`
	LastIP    string `gorm:"column:last_ip;not null" json:"last_ip"`
	Logins    int32  `gorm:"column:logins;not null" json:"logins"`
	Sex       string `gorm:"column:sex" json:"sex"`
	Truename  string `gorm:"column:truename" json:"truename"`
	Phone     string `gorm:"column:phone" json:"phone"`
	Address   string `gorm:"column:address" json:"address"`
	Email     string `gorm:"column:email" json:"email"`
}

// TableName Member's table name
func (*Member) TableName() string {
	return TableNameMember
}
