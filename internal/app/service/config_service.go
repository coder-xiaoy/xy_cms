package service

import (
	"log"
	"xy_cms/internal/app/repository"
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
