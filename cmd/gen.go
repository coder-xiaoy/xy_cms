package main

import (
	"log"
	"xy_cms/internal/bootstrap"
	"xy_cms/internal/db"

	"gorm.io/gen"
)

func main() {
	// 1️⃣ 获取数据库连接

	bootstrap.InitDB()
	db := db.GetDb()
	// 2️⃣ 初始化 GORM Gen 代码生成器
	g := gen.NewGenerator(gen.Config{
		OutPath:        "./internal/dal/query",                                             // 生成代码的目录
		Mode:           gen.WithoutContext | gen.WithDefaultQuery | gen.WithQueryInterface, // generate mode
		ModelPkgPath:   "gen_model",
		FieldNullable:  true,
		FieldCoverable: true,
	})

	g.UseDB(db) // 绑定数据库

	// 3️⃣ 生成 `UserEntity` 对应的代码
	//user := g.GenerateModel("admin") // `users` 表
	//g.ApplyBasic(user)
	g.ApplyBasic(g.GenerateAllTable()...)
	// 4️⃣ 生成代码
	g.Execute()
	log.Println("✅ GORM Gen 代码生成完成")
}
