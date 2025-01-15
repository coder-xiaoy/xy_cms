package model

const TableNameJob = "job"

// Job mapped from table <job>
type Job struct {
	Contentid  int32  `gorm:"column:contentid;not null" json:"contentid"`
	Type       string `gorm:"column:type;not null" json:"type"`
	Experience string `gorm:"column:experience;not null" json:"experience"`
	Degree     string `gorm:"column:degree;not null" json:"degree"`
	Sex        string `gorm:"column:sex;not null" json:"sex"`
	Numbers    string `gorm:"column:numbers;not null" json:"numbers"`
	Wage       string `gorm:"column:wage;not null" json:"wage"`
	Content    string `gorm:"column:content;not null" json:"content"`
}

// TableName Job's table name
func (*Job) TableName() string {
	return TableNameJob
}
