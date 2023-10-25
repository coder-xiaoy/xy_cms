package test

import (
	"fmt"
	"gorm.io/driver/mysql"
	"gorm.io/gen/field"
	"gorm.io/gorm"
	"testing"
	"xy_cms/internal/app/model"
)
import "gorm.io/gen"

type Queriers interface {
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
	g.ApplyInterface(func(Queriers) {}, model.ModelM{})
	g.Execute()
}
func TestModel1(t *testing.T) {
	var s = model.ContentWithMore{}
	s.TableName()
}

type Tree struct {
	ListTree
	Children []*Tree
}
type ListTree struct {
	Name string
	Pid  int64
	ID   int64
}

func TestTree(t *testing.T) {
	var list = []*Tree{}
	var tree []*Tree
	s := &Tree{}
	s.ListTree = ListTree{Name: "1", Pid: 0, ID: 1}
	s.Name = "1"
	for _, v := range list {
		if v.Pid == 0 {
			continue
		}
		for _, v1 := range list {
			if v1.ID == v.Pid {
				v1.Children = append(v1.Children, v)
			}
		}
	}
	for _, v := range list {
		if v.Pid != 0 {
			continue
		}
		tree = append(tree, v)
	}
	for _, v := range list {
		fmt.Printf("%+v\n", v)
	}
	fmt.Println("tree")
	for _, v := range tree {
		fmt.Printf("%+v\n", v)
	}
}
