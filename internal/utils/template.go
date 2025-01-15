package utils

import "fmt"

func Loop(params ...string) []string {
	for _, param := range params {
		fmt.Println("Hello, ", param)
	}
	return params
}
