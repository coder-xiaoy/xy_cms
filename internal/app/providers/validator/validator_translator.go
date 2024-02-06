package validator

import (
	"errors"
	"github.com/gin-gonic/gin/binding"
	"github.com/go-playground/locales/zh"
	ut "github.com/go-playground/universal-translator"
	"github.com/go-playground/validator/v10"
	zhTranslations "github.com/go-playground/validator/v10/translations/zh"
	"reflect"
	"strings"
)

var trans ut.Translator

func init() {
	uni := ut.New(zh.New())
	trans, _ = uni.GetTranslator("zh")
	if v, ok := binding.Validator.Engine().(*validator.Validate); ok {
		v.RegisterTagNameFunc(func(field reflect.StructField) string {
			return string(field.Tag)
		})
		if err := zhTranslations.RegisterDefaultTranslations(v, trans); err != nil {
			panic(err)
		}
	}
}

func TranslateErrors(err error, tag string) map[string]string {
	var validateErrors map[string]string
	validateErrors = make(map[string]string, 0)
	var errs validator.ValidationErrors
	ok := errors.As(err, &errs)
	if ok {
		for _, v := range errs {
			//fmt.Println(k)
			structTag := reflect.StructTag(v.Field())
			if tag, ok := structTag.Lookup(tag); ok {
				label, ok := structTag.Lookup("label")
				if ok {
					validateErrors[tag] = strings.Replace(v.Translate(trans), v.Field(), label, 1)
				} else {
					validateErrors[tag] = strings.Replace(v.Translate(trans), v.Field(), tag, 1)
				}

			}
		}
	}
	return validateErrors
}
func TranslateSliceErrors(err error, tag string) []string {
	errs := make([]string, 0)
	translateErrors := TranslateErrors(err, tag)
	for key := range translateErrors {
		errs = append(errs, translateErrors[key])
	}
	return errs
}
