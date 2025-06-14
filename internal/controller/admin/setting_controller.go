package admin

import (
	"encoding/json"
	"fmt"
	"github.com/flosch/pongo2/v6"
	"github.com/gin-gonic/gin"
	"github.com/gin-gonic/gin/binding"
	"golang.org/x/exp/slog"
	validator2 "xy_cms/internal/providers/validator"
	"xy_cms/internal/request"
	"xy_cms/internal/service"
)

type settingController struct {
	errorController
}
 
func newSettingController() settingController {
	return settingController{}
}
func (s *settingController) Show(ctx *gin.Context) {

	config, _ := service.ConfigService.GetConfigSetting()
	templates := service.TemplateService.GetThemeList()
	slog.ErrorContext(ctx.Request.Context(), "settingController.Show()", config)
	ctx.HTML(200, "admin/setting/view.html", pongo2.Context{
		"cfg":       config,
		"templates": templates,
	})
}
func (s *settingController) Update(ctx *gin.Context) {
	var settingRequest request.SettingRequest
	err := ctx.ShouldBindWith(&settingRequest, binding.FormPost)
	if err != nil {
		s.ShowMsg(ctx, "-1", validator2.TranslateSliceErrors(err, "form"))
		return
	}
	configStr, err := json.Marshal(settingRequest)
	if err != nil {
		s.ShowMsg(ctx, "-1", []string{"保存失败"})
	}
	if ok := service.ConfigService.UpdateConfigByTag("config", string(configStr)); ok != nil {
		fmt.Println(ok)

		s.ShowMsg(ctx, "-1", []string{"保存失败"})
		return
	}
	s.ShowMsg(ctx, "-1", []string{"保存成功"})
}
