package model

type Admin struct {
	ID        uint   `gorm:"column:id"`
	Username  string `gorm:"column:username"`
	Password  string `gorm:"column:password"`
	Encrypt   string `gorm:"column:encrypt"`
	LastTime  int    `gorm:"column:last_time"`
	CreatTime int    `gorm:"column:creat_time"`
	IsLock    int16  `gorm:"column:is_lock"`
	LastIp    string `gorm:"column:last_ip"`
	Logins    int    `gorm:"column:logins"`
	GroupID   uint16 `gorm:"column:group_id"`
}

func (model *Admin) TableName() string {
	return "admin"
}
