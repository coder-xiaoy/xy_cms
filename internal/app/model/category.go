package model

type Category struct {
	ID            uint64 `gorm:"column:id"`
	Model         string `gorm:"column:model"`
	Type          uint8  `gorm:"column:type"`
	ModelID       uint8  `gorm:"column:model_id"`
	ParentID      uint16 `gorm:"column:parent_id"`
	CatName       string `gorm:"column:cat_name"`
	CatDir        string `gorm:"column:cat_dir"`
	Thumb         string `gorm:"column:thumb"`
	Url           string `gorm:"column:url"`
	Sort          uint   `gorm:"column:sort"`
	IsShow        uint8  `gorm:"column:is_show"`
	IsMeShow      uint8  `gorm:"column:is_meshow"`
	IsTarget      uint8  `gorm:"column:is_target"`
	IsHtml        uint8  `gorm:"column:is_html"`
	IsLink        uint8  `gorm:"column:is_link"`
	TemplateCate  string `gorm:"column:template_cate"`
	TemplateList  string `gorm:"column:template_list"`
	TemplateShow  string `gorm:"column:template_show"`
	SeoTitle      string `gorm:"column:seo_title"`
	SeoKey        string `gorm:"column:seo_key"`
	SeoDes        string `gorm:"column:seo_des"`
	Power         string `gorm:"column:power"`
	UrlList       uint   `gorm:"column:url_list"`
	UrlShow       uint   `gorm:"column:url_show"`
	CategoryModel Model  `gorm:"foreignKey:ModelID" gorm:"references:ID"`
}

func (m *Category) TableName() string {
	return "category"
}
