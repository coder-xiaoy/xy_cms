package model

const TableNameAdmin = "admin"

type Admin struct {
	ID        int32  `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	Username  string `gorm:"column:username;not null" json:"username"`
	Password  string `gorm:"column:password;not null" json:"password"`
	Encrypt   string `gorm:"column:encrypt;not null" json:"encrypt"`
	LastTime  int32  `gorm:"column:last_time;not null" json:"last_time"`
	CreatTime int32  `gorm:"column:creat_time;not null" json:"creat_time"`
	IsLock    int32  `gorm:"column:is_lock;not null" json:"is_lock"`
	LastIP    string `gorm:"column:last_ip;not null" json:"last_ip"`
	Logins    int32  `gorm:"column:logins;not null" json:"logins"`
	GroupID   int32  `gorm:"column:group_id;not null" json:"group_id"`
}

func (*Admin) TableName() string {
	return TableNameAdmin
}
