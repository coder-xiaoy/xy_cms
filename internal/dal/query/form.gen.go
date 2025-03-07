// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.

package query

import (
	"context"

	"gorm.io/gorm"
	"gorm.io/gorm/clause"
	"gorm.io/gorm/schema"

	"gorm.io/gen"
	"gorm.io/gen/field"

	"gorm.io/plugin/dbresolver"

	"xy_cms/internal/dal/gen_model"
)

func newForm(db *gorm.DB, opts ...gen.DOOption) form {
	_form := form{}

	_form.formDo.UseDB(db, opts...)
	_form.formDo.UseModel(&gen_model.Form{})

	tableName := _form.formDo.TableName()
	_form.ALL = field.NewAsterisk(tableName)
	_form.ID = field.NewInt32(tableName, "id")
	_form.FormName = field.NewString(tableName, "form_name")
	_form.FormTable = field.NewString(tableName, "form_table")
	_form.IsLock = field.NewBool(tableName, "is_lock")
	_form.IsFixed = field.NewBool(tableName, "is_fixed")
	_form.IsEmail = field.NewBool(tableName, "is_email")
	_form.IsCode = field.NewBool(tableName, "is_code")

	_form.fillFieldMap()

	return _form
}

type form struct {
	formDo

	ALL       field.Asterisk
	ID        field.Int32
	FormName  field.String
	FormTable field.String
	IsLock    field.Bool
	IsFixed   field.Bool
	IsEmail   field.Bool
	IsCode    field.Bool

	fieldMap map[string]field.Expr
}

func (f form) Table(newTableName string) *form {
	f.formDo.UseTable(newTableName)
	return f.updateTableName(newTableName)
}

func (f form) As(alias string) *form {
	f.formDo.DO = *(f.formDo.As(alias).(*gen.DO))
	return f.updateTableName(alias)
}

func (f *form) updateTableName(table string) *form {
	f.ALL = field.NewAsterisk(table)
	f.ID = field.NewInt32(table, "id")
	f.FormName = field.NewString(table, "form_name")
	f.FormTable = field.NewString(table, "form_table")
	f.IsLock = field.NewBool(table, "is_lock")
	f.IsFixed = field.NewBool(table, "is_fixed")
	f.IsEmail = field.NewBool(table, "is_email")
	f.IsCode = field.NewBool(table, "is_code")

	f.fillFieldMap()

	return f
}

func (f *form) GetFieldByName(fieldName string) (field.OrderExpr, bool) {
	_f, ok := f.fieldMap[fieldName]
	if !ok || _f == nil {
		return nil, false
	}
	_oe, ok := _f.(field.OrderExpr)
	return _oe, ok
}

func (f *form) fillFieldMap() {
	f.fieldMap = make(map[string]field.Expr, 7)
	f.fieldMap["id"] = f.ID
	f.fieldMap["form_name"] = f.FormName
	f.fieldMap["form_table"] = f.FormTable
	f.fieldMap["is_lock"] = f.IsLock
	f.fieldMap["is_fixed"] = f.IsFixed
	f.fieldMap["is_email"] = f.IsEmail
	f.fieldMap["is_code"] = f.IsCode
}

func (f form) clone(db *gorm.DB) form {
	f.formDo.ReplaceConnPool(db.Statement.ConnPool)
	return f
}

func (f form) replaceDB(db *gorm.DB) form {
	f.formDo.ReplaceDB(db)
	return f
}

type formDo struct{ gen.DO }

type IFormDo interface {
	gen.SubQuery
	Debug() IFormDo
	WithContext(ctx context.Context) IFormDo
	WithResult(fc func(tx gen.Dao)) gen.ResultInfo
	ReplaceDB(db *gorm.DB)
	ReadDB() IFormDo
	WriteDB() IFormDo
	As(alias string) gen.Dao
	Session(config *gorm.Session) IFormDo
	Columns(cols ...field.Expr) gen.Columns
	Clauses(conds ...clause.Expression) IFormDo
	Not(conds ...gen.Condition) IFormDo
	Or(conds ...gen.Condition) IFormDo
	Select(conds ...field.Expr) IFormDo
	Where(conds ...gen.Condition) IFormDo
	Order(conds ...field.Expr) IFormDo
	Distinct(cols ...field.Expr) IFormDo
	Omit(cols ...field.Expr) IFormDo
	Join(table schema.Tabler, on ...field.Expr) IFormDo
	LeftJoin(table schema.Tabler, on ...field.Expr) IFormDo
	RightJoin(table schema.Tabler, on ...field.Expr) IFormDo
	Group(cols ...field.Expr) IFormDo
	Having(conds ...gen.Condition) IFormDo
	Limit(limit int) IFormDo
	Offset(offset int) IFormDo
	Count() (count int64, err error)
	Scopes(funcs ...func(gen.Dao) gen.Dao) IFormDo
	Unscoped() IFormDo
	Create(values ...*gen_model.Form) error
	CreateInBatches(values []*gen_model.Form, batchSize int) error
	Save(values ...*gen_model.Form) error
	First() (*gen_model.Form, error)
	Take() (*gen_model.Form, error)
	Last() (*gen_model.Form, error)
	Find() ([]*gen_model.Form, error)
	FindInBatch(batchSize int, fc func(tx gen.Dao, batch int) error) (results []*gen_model.Form, err error)
	FindInBatches(result *[]*gen_model.Form, batchSize int, fc func(tx gen.Dao, batch int) error) error
	Pluck(column field.Expr, dest interface{}) error
	Delete(...*gen_model.Form) (info gen.ResultInfo, err error)
	Update(column field.Expr, value interface{}) (info gen.ResultInfo, err error)
	UpdateSimple(columns ...field.AssignExpr) (info gen.ResultInfo, err error)
	Updates(value interface{}) (info gen.ResultInfo, err error)
	UpdateColumn(column field.Expr, value interface{}) (info gen.ResultInfo, err error)
	UpdateColumnSimple(columns ...field.AssignExpr) (info gen.ResultInfo, err error)
	UpdateColumns(value interface{}) (info gen.ResultInfo, err error)
	UpdateFrom(q gen.SubQuery) gen.Dao
	Attrs(attrs ...field.AssignExpr) IFormDo
	Assign(attrs ...field.AssignExpr) IFormDo
	Joins(fields ...field.RelationField) IFormDo
	Preload(fields ...field.RelationField) IFormDo
	FirstOrInit() (*gen_model.Form, error)
	FirstOrCreate() (*gen_model.Form, error)
	FindByPage(offset int, limit int) (result []*gen_model.Form, count int64, err error)
	ScanByPage(result interface{}, offset int, limit int) (count int64, err error)
	Scan(result interface{}) (err error)
	Returning(value interface{}, columns ...string) IFormDo
	UnderlyingDB() *gorm.DB
	schema.Tabler
}

func (f formDo) Debug() IFormDo {
	return f.withDO(f.DO.Debug())
}

func (f formDo) WithContext(ctx context.Context) IFormDo {
	return f.withDO(f.DO.WithContext(ctx))
}

func (f formDo) ReadDB() IFormDo {
	return f.Clauses(dbresolver.Read)
}

func (f formDo) WriteDB() IFormDo {
	return f.Clauses(dbresolver.Write)
}

func (f formDo) Session(config *gorm.Session) IFormDo {
	return f.withDO(f.DO.Session(config))
}

func (f formDo) Clauses(conds ...clause.Expression) IFormDo {
	return f.withDO(f.DO.Clauses(conds...))
}

func (f formDo) Returning(value interface{}, columns ...string) IFormDo {
	return f.withDO(f.DO.Returning(value, columns...))
}

func (f formDo) Not(conds ...gen.Condition) IFormDo {
	return f.withDO(f.DO.Not(conds...))
}

func (f formDo) Or(conds ...gen.Condition) IFormDo {
	return f.withDO(f.DO.Or(conds...))
}

func (f formDo) Select(conds ...field.Expr) IFormDo {
	return f.withDO(f.DO.Select(conds...))
}

func (f formDo) Where(conds ...gen.Condition) IFormDo {
	return f.withDO(f.DO.Where(conds...))
}

func (f formDo) Order(conds ...field.Expr) IFormDo {
	return f.withDO(f.DO.Order(conds...))
}

func (f formDo) Distinct(cols ...field.Expr) IFormDo {
	return f.withDO(f.DO.Distinct(cols...))
}

func (f formDo) Omit(cols ...field.Expr) IFormDo {
	return f.withDO(f.DO.Omit(cols...))
}

func (f formDo) Join(table schema.Tabler, on ...field.Expr) IFormDo {
	return f.withDO(f.DO.Join(table, on...))
}

func (f formDo) LeftJoin(table schema.Tabler, on ...field.Expr) IFormDo {
	return f.withDO(f.DO.LeftJoin(table, on...))
}

func (f formDo) RightJoin(table schema.Tabler, on ...field.Expr) IFormDo {
	return f.withDO(f.DO.RightJoin(table, on...))
}

func (f formDo) Group(cols ...field.Expr) IFormDo {
	return f.withDO(f.DO.Group(cols...))
}

func (f formDo) Having(conds ...gen.Condition) IFormDo {
	return f.withDO(f.DO.Having(conds...))
}

func (f formDo) Limit(limit int) IFormDo {
	return f.withDO(f.DO.Limit(limit))
}

func (f formDo) Offset(offset int) IFormDo {
	return f.withDO(f.DO.Offset(offset))
}

func (f formDo) Scopes(funcs ...func(gen.Dao) gen.Dao) IFormDo {
	return f.withDO(f.DO.Scopes(funcs...))
}

func (f formDo) Unscoped() IFormDo {
	return f.withDO(f.DO.Unscoped())
}

func (f formDo) Create(values ...*gen_model.Form) error {
	if len(values) == 0 {
		return nil
	}
	return f.DO.Create(values)
}

func (f formDo) CreateInBatches(values []*gen_model.Form, batchSize int) error {
	return f.DO.CreateInBatches(values, batchSize)
}

// Save : !!! underlying implementation is different with GORM
// The method is equivalent to executing the statement: db.Clauses(clause.OnConflict{UpdateAll: true}).Create(values)
func (f formDo) Save(values ...*gen_model.Form) error {
	if len(values) == 0 {
		return nil
	}
	return f.DO.Save(values)
}

func (f formDo) First() (*gen_model.Form, error) {
	if result, err := f.DO.First(); err != nil {
		return nil, err
	} else {
		return result.(*gen_model.Form), nil
	}
}

func (f formDo) Take() (*gen_model.Form, error) {
	if result, err := f.DO.Take(); err != nil {
		return nil, err
	} else {
		return result.(*gen_model.Form), nil
	}
}

func (f formDo) Last() (*gen_model.Form, error) {
	if result, err := f.DO.Last(); err != nil {
		return nil, err
	} else {
		return result.(*gen_model.Form), nil
	}
}

func (f formDo) Find() ([]*gen_model.Form, error) {
	result, err := f.DO.Find()
	return result.([]*gen_model.Form), err
}

func (f formDo) FindInBatch(batchSize int, fc func(tx gen.Dao, batch int) error) (results []*gen_model.Form, err error) {
	buf := make([]*gen_model.Form, 0, batchSize)
	err = f.DO.FindInBatches(&buf, batchSize, func(tx gen.Dao, batch int) error {
		defer func() { results = append(results, buf...) }()
		return fc(tx, batch)
	})
	return results, err
}

func (f formDo) FindInBatches(result *[]*gen_model.Form, batchSize int, fc func(tx gen.Dao, batch int) error) error {
	return f.DO.FindInBatches(result, batchSize, fc)
}

func (f formDo) Attrs(attrs ...field.AssignExpr) IFormDo {
	return f.withDO(f.DO.Attrs(attrs...))
}

func (f formDo) Assign(attrs ...field.AssignExpr) IFormDo {
	return f.withDO(f.DO.Assign(attrs...))
}

func (f formDo) Joins(fields ...field.RelationField) IFormDo {
	for _, _f := range fields {
		f = *f.withDO(f.DO.Joins(_f))
	}
	return &f
}

func (f formDo) Preload(fields ...field.RelationField) IFormDo {
	for _, _f := range fields {
		f = *f.withDO(f.DO.Preload(_f))
	}
	return &f
}

func (f formDo) FirstOrInit() (*gen_model.Form, error) {
	if result, err := f.DO.FirstOrInit(); err != nil {
		return nil, err
	} else {
		return result.(*gen_model.Form), nil
	}
}

func (f formDo) FirstOrCreate() (*gen_model.Form, error) {
	if result, err := f.DO.FirstOrCreate(); err != nil {
		return nil, err
	} else {
		return result.(*gen_model.Form), nil
	}
}

func (f formDo) FindByPage(offset int, limit int) (result []*gen_model.Form, count int64, err error) {
	result, err = f.Offset(offset).Limit(limit).Find()
	if err != nil {
		return
	}

	if size := len(result); 0 < limit && 0 < size && size < limit {
		count = int64(size + offset)
		return
	}

	count, err = f.Offset(-1).Limit(-1).Count()
	return
}

func (f formDo) ScanByPage(result interface{}, offset int, limit int) (count int64, err error) {
	count, err = f.Count()
	if err != nil {
		return
	}

	err = f.Offset(offset).Limit(limit).Scan(result)
	return
}

func (f formDo) Scan(result interface{}) (err error) {
	return f.DO.Scan(result)
}

func (f formDo) Delete(models ...*gen_model.Form) (result gen.ResultInfo, err error) {
	return f.DO.Delete(models)
}

func (f *formDo) withDO(do gen.Dao) *formDo {
	f.DO = *do.(*gen.DO)
	return f
}
