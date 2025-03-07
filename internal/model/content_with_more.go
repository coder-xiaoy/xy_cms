package model

type ContentWithMore struct {
	Content
	ExtendContent map[string]interface{} `gorm:"-" json:"extend_content"`
}
type CommonMethod struct {
	ID   int32
	Name *string
}
