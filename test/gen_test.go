package test

import (
	"gorm.io/driver/mysql"
	"gorm.io/gen/field"
	"gorm.io/gorm"
	"testing"
	"xy_cms/internal/app/model"
)
import "gorm.io/gen"

type Querier interface {
	// SELECT * FROM @@table WHERE id=@id
	GetByID(id int32) (gen.T, error)
}

func TestModel(t *testing.T) {
	dsn := "root:123456@tcp(192.168.147.115:3306)/test?charset=utf8mb4&parseTime=True&loc=Local"
	gormdb, _ := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	g := gen.NewGenerator(gen.Config{
		OutPath: "../internal/app/query",
		Mode:    gen.WithoutContext | gen.WithDefaultQuery | gen.WithQueryInterface, // generate mode
	})
	g.UseDB(gormdb)
	modelField := g.GenerateModel("model_field")
	modelx := g.GenerateModelAs("model", "ModelM", gen.FieldRelate(field.HasMany, "ModelFields", modelField,
		&field.RelateConfig{
			GORMTag: field.GormTag{"foreignKey": []string{"modelid"}, "references": []string{"id"}},
		},
	))
	category := g.GenerateModel("category", gen.FieldRelate(field.HasOne, "CategoryModel", modelx,
		&field.RelateConfig{
			GORMTag: field.GormTag{"foreignKey": []string{"id"}, "references": []string{"model_id"}},
		}), gen.WithMethod(model.CommonMethod{}.TableName))
	g.ApplyBasic(modelField, modelx, category)
	//g.GenerateAllTable()
	//g.ApplyInterface(func(Querier) {}, model.ModelM{})
	g.Execute()
}
func TestModel1(t *testing.T) {
	var s = model.ContentWithMore{}
	s.TableName()
}
