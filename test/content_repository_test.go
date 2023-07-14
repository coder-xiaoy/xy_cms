package test

import (
	"fmt"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"testing"
	"xy_cms/internal/app/repository"
)

func TestGetContent(t *testing.T) {
	dsn := "root:123456@tcp(192.168.147.115:3306)/test?charset=utf8mb4&parseTime=True&loc=Local"
	db, _ := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	contentRepository := repository.NewContentRepository(db)
	res, err := contentRepository.GetContentByCategoryId(1)
	_ = fmt.Sprintf("%+v", res)
	fmt.Println(fmt.Sprintf("%+v", res), err)
}
