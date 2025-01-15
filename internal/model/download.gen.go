package model

const TableNameDownload = "download"

// Download mapped from table <download>
type Download struct {
	Contentid int32  `gorm:"column:contentid;not null" json:"contentid"`
	Files     string `gorm:"column:files;not null" json:"files"`
	Content   string `gorm:"column:content;not null" json:"content"`
}

// TableName Download's table name
func (*Download) TableName() string {
	return TableNameDownload
}
