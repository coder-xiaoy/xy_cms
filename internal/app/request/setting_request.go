package request

type SettingRequest struct {
	SiteName    string `form:"sitename" binding:"required" json:"sitename" label:"网站名称"`
	SiteUrl     string `form:"siteurl" binding:"required" json:"siteurl" label:"网站地址"`
	LogoUrl     string `form:"logourl" binding:"required" json:"logourl" label:"网站LOGO地址"`
	Template    string `form:"template" binding:"required" json:"template" label:"默认模板"`
	Caching     bool   `form:"caching"   json:"caching" label:"开启模板缓存"`
	Cookie      string `form:"cookie" binding:"required" json:"cookie" label:"Cookie密钥"`
	Copyright   string `form:"copyright" json:"copyright" label:"版权信息"`
	CreateHtml  int32  `form:"createhtml" binding:"gte=0,lte=2" json:"createhtml" label:"是否静态优化"`
	Apply       int32  `form:"apply" binding:"gte=0,lte=1" json:"apply" label:"将静态化配置应用到所有栏目"`
	Title       string `form:"title" binding:"required" json:"title" label:"网站标题"`
	Keywords    string `form:"keywords" binding:"required" json:"keywords" label:"网站META关键词"`
	Description string `form:"description" binding:"required" json:"description" label:"网站META网页描述"`
	//Tag         string `form:"tag" binding:"required" json:"tag" label:"网站名称"`
}
