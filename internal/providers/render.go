package providers

import (
	"github.com/flosch/pongo2/v6"
	"github.com/gin-gonic/gin"
	"github.com/gin-gonic/gin/render"
	"net/http"
)

type RenderOptions struct {
	TemplateDir string
	TemplateSet *pongo2.TemplateSet
	ContentType string
}
type Pengo2Render struct {
	Options  *RenderOptions
	Template *pongo2.Template
	Context  pongo2.Context
}

func NewPengo2Render(options RenderOptions) *Pengo2Render {
	if options.TemplateSet == nil {
		loader := pongo2.MustNewLocalFileSystemLoader(options.TemplateDir)
		options.TemplateSet = pongo2.NewSet(options.TemplateDir, loader)
		options.TemplateSet.Debug = gin.Mode() == "debug"
	}
	return &Pengo2Render{
		Options: &options,
	}
}
func DefaultPengo2Render() *Pengo2Render {
	return NewPengo2Render(RenderOptions{
		TemplateDir: "templates",
		TemplateSet: nil,
		ContentType: "text/html; charset=utf-8",
	})
}
func (r Pengo2Render) Instance(name string, data interface{}) render.Render {
	return Pengo2Render{
		Template: pongo2.Must(r.Options.TemplateSet.FromCache(name)),
		Context:  data.(pongo2.Context),
		Options:  r.Options,
	}
}
func (r Pengo2Render) Render(writer http.ResponseWriter) error {
	r.WriteContentType(writer)
	err := r.Template.ExecuteWriter(r.Context, writer)
	return err
}

func (r Pengo2Render) WriteContentType(w http.ResponseWriter) {
	header := w.Header()
	if val := header["Content-Type"]; len(val) == 0 {
		header["Content-Type"] = []string{r.Options.ContentType}
	}

}
