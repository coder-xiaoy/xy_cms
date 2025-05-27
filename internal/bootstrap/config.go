package bootstrap

import (
	"bytes"
	"github.com/spf13/viper"
	"log"
	"os"
	"path/filepath"
	"xy_cms/internal/conf"
)

func InitConfig() {
	viper.SetConfigType("yaml")

	exePath, err := os.Executable()
	if err != nil {
		log.Fatalf("failed to get executable path: %v", err)
	}

	configPath := filepath.Join(filepath.Dir(exePath), "../", "config", "config.yml")
	file, err := os.ReadFile(configPath)
	if err != nil {
		log.Fatalf("failed to read config file at %s: %v", configPath, err)
	}
	if err := viper.ReadConfig(bytes.NewBuffer(file)); err != nil {
		log.Fatalf("failed to parse config file: %v", err)
	}
	log.Println(viper.AllKeys())
	conf.Conf = conf.DefaultConfig()
	if err := viper.Unmarshal(&conf.Conf); err != nil {
		log.Fatalf("failed to unmarshal config: %v", err)
	}
}
