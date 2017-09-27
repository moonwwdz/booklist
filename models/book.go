package models

import (
	"fmt"
	"time"

	"github.com/astaxie/beego/orm"
)

type BookMonth struct {
	Month time.Month
	Ctn   int
	Books []Book
}

type Book struct {
	Id     int
	Name   string    `valid:"Required"`
	Title  string    `valid:"Required"`
	Desc   string    `valid:"Required"`
	Url    string    `valid:"Required"`
	Start  time.Time `orm:"auto_now_add;type(datetime)"`
	Finish time.Time `orm:"auto_now;type(datetime)"`
}

func init() {
	orm.RegisterModel(new(Book))
}

func GetAll() *[]Book {
	bookList := new([]Book)
	num, err := orm.NewOrm().QueryTable("book").OrderBy("-finish").All(bookList)
	if err != nil {
		fmt.Printf("Error: Returned Rows Num: %d, %s", num, err)
	}
	return bookList
}
