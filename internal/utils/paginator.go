package utils

import (
	"math"
)

type Paginator[T any] struct {
	TotalCount int64 `json:"total_count"`
	Page       int64 `json:"page"`
	PageSize   int64 `json:"page_size"`
	Result     T     `json:"result"`
}

func NewPaginator[T any](totalCount, page, pageSize int64) *Paginator[T] {
	if page < 1 {
		page = 1
	}
	if pageSize <= 0 {
		pageSize = 10
	}
	return &Paginator[T]{
		TotalCount: totalCount,
		Page:       page,
		PageSize:   pageSize,
	}
}

// TotalPages 计算总页数
func (p *Paginator[T]) TotalPages() int64 {
	return int64(math.Ceil(float64(p.TotalCount) / float64(p.PageSize)))
}

// HasPrevious 判断是否有上一页
func (p *Paginator[T]) HasPrevious() bool {
	return p.Page > 1
}

// HasNext 判断是否有下一页
func (p *Paginator[T]) HasNext() bool {
	return p.Page < p.TotalPages()
}

// StartIndex 当前页的起始索引（基于 0）
func (p *Paginator[T]) StartIndex() int64 {
	return (p.Page - 1) * p.PageSize
}

// EndIndex 当前页的结束索引（不包含），用于切片的结束索引
func (p *Paginator[T]) EndIndex() int64 {
	endIndex := p.StartIndex() + p.PageSize
	if endIndex > p.TotalCount {
		endIndex = p.TotalCount
	}
	return endIndex
}
func (p *Paginator[T]) ShowPageNum(limit int64) []int64 {
	var numbers []int64
	numbers = append(numbers, p.PreviousPages(limit)...)
	numbers = append(numbers, p.Page)
	numbers = append(numbers, p.NextPages(limit)...)
	return numbers
}

// PreviousPages 获取当前页的前 5 个页码
func (p *Paginator[T]) PreviousPages(limit int64) []int64 {
	start := p.Page - limit
	if start < 1 {
		start = 1
	}
	pages := make([]int64, 0)
	for i := start; i < p.Page; i++ {
		pages = append(pages, i)
	}
	return pages
}

// NextPages 获取当前页的后 5 个页码
func (p *Paginator[T]) NextPages(limit int64) []int64 {
	end := p.Page + limit
	totalPages := p.TotalPages()
	if end > totalPages {
		end = totalPages
	}
	pages := make([]int64, 0)
	for i := p.Page + 1; i <= end; i++ {
		pages = append(pages, i)
	}
	return pages
}
