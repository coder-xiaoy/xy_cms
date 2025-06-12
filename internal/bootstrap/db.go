package bootstrap

import (
	"context"
	"fmt"
	"golang.org/x/exp/slog"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
	"gorm.io/gorm/utils"
	"time"
	"xy_cms/internal/conf"
	"xy_cms/internal/db"
)

func InitDB() {
	dsn := fmt.Sprintf("%s:%s@tcp(%s)/%s?charset=utf8mb4&parseTime=True&loc=Local", conf.Conf.Database.Username, conf.Conf.Database.Password, conf.Conf.Database.Url, conf.Conf.Database.Database)
	dB, _ := gorm.Open(mysql.Open(dsn), &gorm.Config{
		//Logger: New(logger.Info),
		Logger: logger.Default.LogMode(logger.Info),
	})
	db.Init(dB)

}

type SlogLogger struct {
	LogLevel logger.LogLevel
}

func New(logLevel logger.LogLevel) *SlogLogger {
	return &SlogLogger{LogLevel: logLevel}
}

func (l *SlogLogger) LogMode(level logger.LogLevel) logger.Interface {
	newLogger := *l
	newLogger.LogLevel = level
	return &newLogger
}

func (l *SlogLogger) Info(ctx context.Context, msg string, data ...interface{}) {
	if l.LogLevel >= logger.Info {
		slog.Info(fmt.Sprintf(msg, data...))
	}
}

func (l *SlogLogger) Warn(ctx context.Context, msg string, data ...interface{}) {
	if l.LogLevel >= logger.Warn {
		slog.Warn(fmt.Sprintf(msg, data...))
	}
}

func (l *SlogLogger) Error(ctx context.Context, msg string, data ...interface{}) {
	if l.LogLevel >= logger.Error {
		slog.Error(fmt.Sprintf(msg, data...))
	}
}

func (l *SlogLogger) Trace(ctx context.Context, begin time.Time, fc func() (sql string, rowsAffected int64), err error) {
	if l.LogLevel <= logger.Silent {
		return
	}

	elapsed := time.Since(begin)
	sql, rows := fc()
	file := utils.FileWithLineNum()

	switch {
	case err != nil && l.LogLevel >= logger.Error:
		slog.Error("SQL Error",
			"file", file,
			"duration", elapsed,
			"rows", rows,
			"sql", sql,
			"error", err,
		)
	case elapsed > time.Millisecond*200 && l.LogLevel >= logger.Warn:
		slog.Warn("Slow SQL",
			"file", file,
			"duration", elapsed,
			"rows", rows,
			"sql", sql,
		)
	case l.LogLevel >= logger.Info:
		slog.Info("SQL",
			"file", file,
			"duration", elapsed,
			"rows", rows,
			"sql", sql,
		)
	}
}
