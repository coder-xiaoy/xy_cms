package main

import (
	"fmt"
	"github.com/duke-git/lancet/v2/stream"
	"gorm.io/gen"
	"gorm.io/gen/field"
	"log"
	"xy_cms/internal/bootstrap"
	"xy_cms/internal/db"
)

// Dynamic SQL
type Querier interface {
	// SELECT * FROM @@table WHERE name = @name{{if role !=""}} AND role = @role{{end}}
	FilterWithNameAndRole(name, role string) ([]gen.T, error)
}

func main() {
	// 1️⃣ 获取数据库连接

	bootstrap.InitDB()
	// 2️⃣ 初始化 GORM Gen 代码生成器
	g := gen.NewGenerator(gen.Config{
		OutPath:        "./internal/dal/query",                                             // 生成代码的目录
		Mode:           gen.WithoutContext | gen.WithDefaultQuery | gen.WithQueryInterface, // generate mode
		ModelPkgPath:   "gen_model",
		FieldNullable:  true,
		FieldCoverable: true,
	})

	g.UseDB(db.GetDb()) // 绑定数据库
	tableList, err := db.GetDb().Migrator().GetTables()
	if err != nil {
		panic(fmt.Errorf("get all tables fail: %w", err))
	}
	var modelTableList []string
	customTableList := []string{"admin_group", "admin"}
	db.GetDb().Table("model").Select("model_table").Find(&modelTableList)
	fmt.Println(customTableList)
	tableList = stream.FromSlice(tableList).Filter(func(item string) bool {
		return stream.FromSlice(append(modelTableList, customTableList...)).IndexOf(item, func(a, b string) bool {
			return a == b
		}) == -1
	}).ToSlice()
	fmt.Println(tableList)
	log.Println(tableList)
	var models []any
	stream.FromSlice(tableList).ForEach(func(item string) {
		models = append(models, g.GenerateModel(item))
	})

	adminGroup := g.GenerateModel("admin_group", gen.FieldRelate(field.HasMany, "Admins", g.GenerateModel("admin"),
		&field.RelateConfig{GORMTag: field.GormTag{
			"foreignKey": []string{"GroupId"},
		}}))

	admin := g.GenerateModel("admin", gen.FieldRelate(field.BelongsTo, "AdminGroup", adminGroup,
		&field.RelateConfig{
			GORMTag: field.GormTag{"foreignKey": []string{"GroupId"}, "references": []string{"ID"}},
		}))
	models = append(models, admin, adminGroup)
	log.Println("✅ GORM Gen 打印models")
	log.Println(models)
	//g.ApplyBasic(g.GenerateAllTable()...)
	g.ApplyBasic(models...)
	//g.ApplyInterface(func(Querier) {}, g.GenerateAllTable()...)
	// 4️⃣ 生成代码
	g.Execute()
	log.Println("✅ GORM Gen 代码生成完成")
}
