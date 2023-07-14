package test

import (
	"fmt"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"testing"
	"xy_cms/internal/app/repository"
)

func TestModelRepository(t *testing.T) {
	dsn := "root:123456@tcp(192.168.147.115:3306)/test?charset=utf8mb4&parseTime=True&loc=Local"
	db, _ := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	modelRepository := repository.NewModelRepository(db)
	model, err := modelRepository.FindModelById(1)
	fmt.Println(model, err)
	res, err := modelRepository.GetModelAll()
	fmt.Println(res, err)
}
