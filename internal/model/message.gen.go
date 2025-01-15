package model

const TableNameMessage = "message"

// Message mapped from table <message>
type Message struct {
	ID        int32  `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	Title     string `gorm:"column:title;not null" json:"title"`
	Inputtime int32  `gorm:"column:inputtime;not null" json:"inputtime"`
	Truename  string `gorm:"column:truename;not null" json:"truename"`
	Telephone string `gorm:"column:telephone;not null" json:"telephone"`
	Address   string `gorm:"column:address;not null" json:"address"`
	Content   string `gorm:"column:content;not null" json:"content"`
}

// TableName Message's table name
func (*Message) TableName() string {
	return TableNameMessage
}
