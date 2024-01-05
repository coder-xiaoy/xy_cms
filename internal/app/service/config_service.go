package service

import (
	"encoding/json"
	"log"
	"xy_cms/internal/app/repository"
	"xy_cms/internal/app/response"
)

type configService struct {
}

func newConfigService() configService {
	return configService{}
}

func (c *configService) GetConfigByTag(tag string) (string, error) {
	var configStr string
	config, err := repository.ConfigRepository.GetConfigByTag(tag)
	if err != nil {
		log.Print("err:" + err.Error())
		return configStr, err
	}
	return config.ConfigArray, err
}
func (c *configService) UpdateConfigByTag(tag string, config string) error {
	return repository.ConfigRepository.UpdateConfigByTag(tag, config)

}
func (c *configService) GetConfigSetting() (response.SettingResponse, error) {
	var configSetting response.SettingResponse
	config, err := repository.ConfigRepository.GetConfigByTag("config")
	if err != nil {
		log.Printf("err:" + err.Error())
		return configSetting, err
	}
	err = json.Unmarshal([]byte(config.ConfigArray), &configSetting)
	if err != nil {
		log.Printf("err:" + err.Error())
	}
	return configSetting, err
}
