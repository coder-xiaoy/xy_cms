package db

import (
	"gorm.io/gorm"
	"time"
)

var db *gorm.DB

func Init(d *gorm.DB) {
	sqlDb, _ := d.DB()
	sqlDb.SetConnMaxLifetime(1 * time.Hour)
	sqlDb.SetConnMaxIdleTime(5)
	sqlDb.SetMaxOpenConns(10)
	sqlDb.SetMaxIdleConns(5)
	db = d
}
func GetDb() *gorm.DB {
	return db
}
