package tags

import (
	"fmt"
	"github.com/flosch/pongo2/v6"
	"xy_cms/internal/app/service"
)

func init() {
	pongo2.RegisterTag("loop", tagLoopParser)
}

type tagLookNode struct {
	args    map[string]string
	wrapper *pongo2.NodeWrapper
}

func (t *tagLookNode) Execute(context *pongo2.ExecutionContext, writer pongo2.TemplateWriter) *pongo2.Error {
	loopCtx := pongo2.NewChildExecutionContext(context)
	fmt.Println(t.args)

	res, _ := service.ModelMService.GetList()
	loopCtx.Private["res"] = res
	t.wrapper.Execute(loopCtx, writer)
	return nil
}

func tagLoopParser(doc *pongo2.Parser, start *pongo2.Token, arguments *pongo2.Parser) (pongo2.INodeTag, *pongo2.Error) {
	args := make(map[string]pongo2.IEvaluator, 0)
	loopTag := &tagLookNode{}
	for arguments.Remaining() > 0 {
		// We have at least one key=expr pair (because of starting "with")

		keyToken := arguments.MatchType(pongo2.TokenIdentifier)
		if keyToken == nil {
			return nil, arguments.Error("Expected an identifier", nil)
		}
		if arguments.Match(pongo2.TokenSymbol, ",") != nil {
			continue
		}
		if arguments.Match(pongo2.TokenSymbol, "=") != nil {
			valueExpr, err := arguments.ParseExpression()
			if err != nil {
				return nil, arguments.Error("Can not parse with args.", keyToken)
			}

			args[keyToken.Val] = valueExpr
		}

	}
	wrapper, _, err := doc.WrapUntilTag("endloop")
	if err != nil {
		return nil, err
	}

	loopTag.wrapper = wrapper
	return loopTag, nil
}
