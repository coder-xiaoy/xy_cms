package service

import (
	"context"
	"fmt"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
	"testing"
	"time"
	"xy_cms/internal/repository"
	"xy_cms/internal/utils"
	"xy_cms/model"
)

func gen(ctx context.Context) <-chan int {
	dst := make(chan int)
	n := 1
	go func() {
		for {
			select {
			case <-ctx.Done():
				return // return结束该goroutine，防止泄露
			case dst <- n:
				n++
			}
		}
	}()
	return dst
}
func Test_contentService_GetContentListByCategoryId(t *testing.T) {
	dsn := "root:123456@tcp(192.168.147.115:3306)/test?charset=utf8mb4&parseTime=True&loc=Local"
	db, _ := gorm.Open(mysql.Open(dsn), &gorm.Config{
		Logger: logger.Default.LogMode(logger.Error),
	})
	sqlDb, _ := db.DB()
	sqlDb.SetConnMaxLifetime(1 * time.Hour)
	sqlDb.SetConnMaxIdleTime(5)
	sqlDb.SetMaxOpenConns(10)
	sqlDb.SetMaxIdleConns(5)
	repository.SetDefault(db)
	type args struct {
		catId    int64
		page     int64
		pageSize int64
	}
	var tests []struct {
		name    string
		args    args
		want    *utils.Paginator[[]model.Content]
		wantErr bool
	}
	for i := 1; i <= 5; i++ {
		tests = append(tests, struct {
			name    string
			args    args
			want    *utils.Paginator[[]model.Content]
			wantErr bool
		}{
			name: fmt.Sprintf("Test case %d", i),
			args: args{
				catId:    int64(i), // 假设 catId 从 1 到 5 递增
				page:     1,        // 使用相同的 page 和 pageSize
				pageSize: 10,
			},
			want: &utils.Paginator[[]model.Content]{
				TotalCount: 1,
				Page:       1,
				PageSize:   10,
				Result:     []model.Content{},
			},
			wantErr: false,
		})
	}
	//	ctx1, cancel := context.WithCancel(context.Background())
	//	defer cancel() // 当我们取完需要的整数后调用cancel
	//
	//	for n := range gen(ctx1) {
	//		fmt.Println(n)
	//		if n == 5 {
	//			break
	//		}
	//	}
	//	ctx, _ := context.WithTimeout(context.Background(), 5*time.Second)
	//OuterLoop:
	//	for i := 0; i < 1000; i++ {
	//		select {
	//		case <-ctx.Done(): // 如果上下文被取消，立即返回
	//			fmt.Println(ctx.Err())
	//			break OuterLoop
	//		default:
	//			fmt.Println(i)
	//			time.Sleep(1 * time.Second)
	//		}
	//	}
	ctx, _ := context.WithTimeout(context.Background(), 1*time.Second)
	ctx.Deadline()
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			_, err := repository.CategoryRepository.WithContext(ctx).GetCategoryByCategoryId(1)

			time.Sleep(1 * time.Second)
			if (err != nil) != tt.wantErr {
				t.Errorf("GetContentListByCategoryId() error = %v, wantErr %v", err, tt.wantErr)
				return
			}

		})
	}
}
