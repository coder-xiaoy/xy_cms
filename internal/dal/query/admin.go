package query

import (
	"gorm.io/gorm"
	"strings"
	"xy_cms/internal/dal/gen_model"
)

func (a adminDo) FilterWithNameAndRoleT(name string, role string) (result []gen_model.Admin, err error) {
	var params []interface{}

	var generateSQL strings.Builder
	params = append(params, name)
	generateSQL.WriteString("SELECT * FROM admin WHERE name = ? ")
	if role != "" {
		params = append(params, role)
		generateSQL.WriteString("AND role = ? ")
	}
	a.UnderlyingDB().Table("admin").Where("")
	var executeSQL *gorm.DB
	executeSQL = a.UnderlyingDB().Raw(generateSQL.String(), params...).Find(&result) // ignore_security_alert
	err = executeSQL.Error

	return
}
