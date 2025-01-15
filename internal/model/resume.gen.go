package model

const TableNameResume = "resume"

// Resume mapped from table <resume>
type Resume struct {
	ID        int32  `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	Title     string `gorm:"column:title;not null" json:"title"`
	Inputtime int32  `gorm:"column:inputtime;not null" json:"inputtime"`
	Truename  string `gorm:"column:truename;not null" json:"truename"`
	Age       string `gorm:"column:age;not null" json:"age"`
	Telephone string `gorm:"column:telephone;not null" json:"telephone"`
	Degree    string `gorm:"column:degree;not null" json:"degree"`
	Address   string `gorm:"column:address;not null" json:"address"`
	School    string `gorm:"column:school;not null" json:"school"`
	Work      string `gorm:"column:work;not null" json:"work"`
}

// TableName Resume's table name
func (*Resume) TableName() string {
	return TableNameResume
}
