package errors

type ErrorServices struct {
	s string
}

func (e *ErrorServices) Error() string {
	return e.s
}
func NewErrorServices(s string) error {
	return &ErrorServices{s}
}
