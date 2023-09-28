package tags

import (
	"github.com/flosch/pongo2/v6"
)

func init() {
	pongo2.RegisterTag("loop", tagLoopParser)
}

type tagLookNode struct {
	args    map[string]string
	wrapper *pongo2.NodeWrapper
}

func (t tagLookNode) Execute(context *pongo2.ExecutionContext, writer pongo2.TemplateWriter) *pongo2.Error {
	//TODO implement me
	panic("implement me")
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
	return loopTag, nil
}
