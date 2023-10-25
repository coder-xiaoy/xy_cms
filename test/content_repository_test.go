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
	repository.SetDefault(db)
	res, err := repository.ContentRepository.GetContentByCategoryId(28)
	_ = fmt.Sprintf("%+v", res)
	fmt.Println(fmt.Sprintf("%+v", res), err)
}
func TestGenDao(t *testing.T) {
	//dsn := "root:123456@tcp(192.168.147.115:3306)/test?charset=utf8mb4&parseTime=True&loc=Local"
	//db, _ := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	//query.SetDefault(db)
	//u := query.ModelM
	//
	//fmt.Println(u.Where(u.ID.Eq(1)).First())

}
