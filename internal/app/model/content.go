package model

type Content struct {
	ContentId     uint                   `gorm:"column:contentid"`
	CatId         uint8                  `gorm:"column:catid"`
	Title         string                 `gorm:"column:title"`
	Thumb         string                 `gorm:"column:thumb"`
	Keywords      string                 `gorm:"column:keywords"`
	Description   string                 `gorm:"column:description"`
	Commend       uint8                  `gorm:"column:commend"`
	Url           string                 `gorm:"column:url"`
	Userid        uint32                 `gorm:"column:userid"`
	Username      string                 `gorm:"column:username"`
	InputTime     uint                   `gorm:"column:inputtime"`
	UpdateTime    uint                   `gorm:"column:updatetime"`
	Hits          uint                   `gorm:"column:hits"`
	Sort          uint                   `gorm:"column:sort"`
	Style         string                 `gorm:"column:style"`
	Category      Category               `gorm:"foreignKey:CatId" gorm:"references:ID"`
	ExtentContent map[string]interface{} `gorm:"-"`
}

func (m *Content) TableName() string {
	return "content"
}
