package model

const TableNameContent = "content"

// Content mapped from table <content>
type Content struct {
	Contentid   int64  `gorm:"column:contentid;primaryKey;autoIncrement:true" json:"contentid"`
	Catid       int64  `gorm:"column:catid;not null" json:"catid"`
	Title       string `gorm:"column:title;not null" json:"title"`
	Thumb       string `gorm:"column:thumb;not null" json:"thumb"`
	Keywords    string `gorm:"column:keywords;not null" json:"keywords"`
	Description string `gorm:"column:description;not null" json:"description"`
	Commend     bool   `gorm:"column:commend;not null" json:"commend"`
	URL         string `gorm:"column:url;not null" json:"url"`
	Userid      int32  `gorm:"column:userid;not null" json:"userid"`
	Username    string `gorm:"column:username;not null" json:"username"`
	Inputtime   int32  `gorm:"column:inputtime;not null" json:"inputtime"`
	Updatetime  int32  `gorm:"column:updatetime;not null" json:"updatetime"`
	Hits        int32  `gorm:"column:hits;not null" json:"hits"`
	Sort        int32  `gorm:"column:sort;not null" json:"sort"`
	Style       string `gorm:"column:style" json:"style"`
}

// TableName Content's table name
func (*Content) TableName() string {
	return TableNameContent
}
