package bootstrap

import (
	"fmt"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
	"xy_cms/internal/conf"
	"xy_cms/internal/db"
	"xy_cms/internal/repository"
)

func InitDB() {
	dsn := fmt.Sprintf("%s:%s@tcp(%s)/%s?charset=utf8mb4&parseTime=True&loc=Local", conf.Conf.Database.Username, conf.Conf.Database.Password, conf.Conf.Database.Url, conf.Conf.Database.Database)
	dB, _ := gorm.Open(mysql.Open(dsn), &gorm.Config{
		Logger: logger.Default.LogMode(logger.Info),
	})
	db.Init(dB)
	repository.SetDefault(db.GetDb())
}
