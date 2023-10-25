package request

// sitename: 123
// siteurl: 123
// logourl: 123
// template: default
// caching: false
// cookie: 123
// copyright: www.sxqfyny.com
// createhtml: 1
// title: 山西沁丰园农业科技有限公司|沁丰园农业|佳昌689|F3588|鑫丰盛966|晋单62|脊玉809|Q100|LY156|H717|金育328|山西玉米种子|玉米种子批发
// keywords: 山西沁丰园农业科技有限公司,沁丰园农业,佳昌689,F3588,鑫丰盛966,晋单62,脊玉809,Q100,LY156,H717,金育328，玉米种子哪家好,玉米种子批发,山西玉米种子哪种好,玉米种子
// description: 山西沁丰园农业科技有限公司,沁丰园农业,佳昌689,F3588,晋单62,脊玉809,Q100,LY156,H717,金育328，玉米种子哪家好,玉米种子批发,山西玉米种子哪种好,玉米种子
// submit: 确认保存
// tag: config
type SettingRequest struct {
	SiteName    int32  `form:"sitename" binding:"required" json:"sitename" label:"网站名称"`
	SiteUrl     string `form:"siteurl" binding:"required" json:"siteurl" label:"网站地址"`
	LogoUrl     string `form:"logourl" binding:"required" json:"logourl" label:"网站LOGO地址"`
	Template    string `form:"template" binding:"required" json:"template" label:"默认模板"`
	Caching     bool   `form:"caching" binding:"required" json:"caching" label:"开启模板缓存"`
	Cookie      string `form:"cookie" binding:"required" json:"cookie" label:"Cookie密钥"`
	Copyright   string `form:"copyright" json:"copyright" label:"版权信息"`
	CreateHtml  int32  `form:"createhtml" binding:"required,gte=0,lte=2" json:"createhtml" label:"是否静态优化"`
	Apply       int32  `form:"apply" binding:"required,gte=0,lte=1" json:"createhtml" label:"将静态化配置应用到所有栏目"`
	Title       string `form:"title" binding:"required" json:"title" label:"网站标题"`
	Keywords    string `form:"keywords" binding:"required" json:"keywords" label:"网站META关键词"`
	Description string `form:"description" binding:"required" json:"description" label:"网站META网页描述"`
	//Tag         string `form:"tag" binding:"required" json:"tag" label:"网站名称"`
}
