package service

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"
	"xy_cms/internal/vo"
)

type templateService struct {
}

func newTemplateService() templateService {
	return templateService{}
}

func (t *templateService) GetThemeList() []string {
	var templateList []string
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
func (t *templateService) GetThemeTemplateList(theme string) vo.ThemeTemplate {
	var list []string
	var themeTemplate vo.ThemeTemplate
	themeTemplate = vo.ThemeTemplate{Category: nil, List: nil, Show: nil}

	glob, _ := filepath.Glob("./resources/views/" + theme + "/*")

	for _, viewPath := range glob {
		fi, err := os.Stat(viewPath)
		if err != nil || fi.IsDir() || filepath.Ext(fi.Name()) != ".html" {
			continue
		}
		templateType := strings.Split(fi.Name(), "_")[0]
		fmt.Println(templateType)
		switch templateType {
		case "category":
			themeTemplate.Category = append(themeTemplate.Category, fi.Name())
			break
		case "list":
			themeTemplate.List = append(themeTemplate.List, fi.Name())
			break
		case "show":
			themeTemplate.Show = append(themeTemplate.Show, fi.Name())
			break
		}
		list = append(list, fi.Name())
	}
	return themeTemplate
}
