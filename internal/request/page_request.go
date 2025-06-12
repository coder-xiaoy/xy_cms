package request

type PageRequest struct {
	Page     int `form:"page" json:"page" query:"page" binding:"required"`
	PageSize int `form:"page_size" json:"page_size" query:"page_size" binding:"required"`
}

func NewPageRequest(page, pageSize int) PageRequest {
	return PageRequest{page, pageSize}
}
func (p PageRequest) GetOffset() int {
	return (p.Page - 1) * p.PageSize
}
