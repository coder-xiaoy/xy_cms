package model

import "gorm.io/gorm/schema"

type ContentWithMore struct {
	Content
	ExtendContent map[string]interface{} `gorm:"-" json:"extend_content"`
}
type CommonMethod struct {
	ID   int32
	Name *string
}

// TableName table name with gorm NamingStrategy
func (m CommonMethod) TableName(namer schema.Namer) string {
	if namer == nil {
		return "@@table"
	}
	return namer.TableName("@@table")
}
