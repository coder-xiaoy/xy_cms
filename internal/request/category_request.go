package request

type CategoryRequest struct {
	Type         bool   `form:"type" json:"type"`
	ModelID      int64  `form:"model_id" binding:"required" json:"model_id"`
	ParentID     int64  `form:"parent_id" json:"parent_id"`
	CatName      string `form:"cat_name" json:"cat_name"`
	CatDir       string `form:"cat_dir" json:"cat_dir"`
	Thumb        string `form:"thumb" json:"thumb"`
	URL          string `form:"url" json:"url"`
	Sort         int32  `form:"sort" json:"sort"`
	IsShow       bool   `form:"is_show" json:"is_show"`
	IsMeshow     bool   `form:"is_meshow" json:"is_meshow"`
	IsTarget     bool   `form:"is_target" json:"is_target"`
	IsHTML       bool   `form:"is_html" json:"is_html"`
	IsLink       bool   `form:"is_link" json:"is_link"`
	TemplateCate string `form:"template_cate" json:"template_cate"`
	TemplateList string `form:"template_list" json:"template_list"`
	TemplateShow string `form:"template_show" json:"template_show"`
	SeoTitle     string `form:"seo_title" json:"seo_title"`
	SeoKey       string `form:"seo_key" json:"seo_key"`
	SeoDes       string `form:"seo_des" json:"seo_des"`
	Power        string `form:"power" json:"power"`
	URLList      int32  `form:"url_list" json:"url_list"`
	URLShow      int32  `form:"url_show" json:"url_show"`
}
