package service

import (
	"os"
	"path/filepath"
	"strings"
)

type templateService struct {
}

func newTemplateService() templateService {
	return templateService{}
}

func (t *templateService) GetTemplateList() []string {
	var templateList []string
	//templateList = append(templateList, "default")
	glob, err := filepath.Glob("./resources/views/*")
	if err != nil {
		return nil
	}
	for _, viewPath := range glob {
		templatePath := viewPath
		fi, err := os.Stat(templatePath)
		if err != nil || !fi.IsDir() {
			continue
		}
		pathArray := strings.Split(templatePath, "\\")
		if pathArray[len(pathArray)-1] != "admin" {
			templateList = append(templateList, pathArray[len(pathArray)-1])
		}
	}
	return templateList
}
