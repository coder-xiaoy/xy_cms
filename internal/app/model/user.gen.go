package model

const TableNameUser = "user"

// User mapped from table <user>
type User struct {
	ID                 int32  `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	Username           string `gorm:"column:username;not null" json:"username"`
	AuthKey            string `gorm:"column:auth_key;not null" json:"auth_key"`
	PasswordHash       string `gorm:"column:password_hash;not null" json:"password_hash"`
	PasswordResetToken string `gorm:"column:password_reset_token" json:"password_reset_token"`
	Email              string `gorm:"column:email;not null" json:"email"`
	Status             int32  `gorm:"column:status;not null;default:10" json:"status"`
	CreatedAt          int32  `gorm:"column:created_at;not null" json:"created_at"`
	UpdatedAt          int32  `gorm:"column:updated_at;not null" json:"updated_at"`
}

// TableName User's table name
func (*User) TableName() string {
	return TableNameUser
}
