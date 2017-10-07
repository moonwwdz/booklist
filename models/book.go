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
	Id      int    `form:"-"`
	Name    string `form:"book_name"`
	Title   string `form:"book_title"`
	Desc    string `form:"book_desc"`
	Url     string `form:"book_url"`
	Noteurl string `form:"note_url"`
	Process int    `form:"book_process"`
	//Score   float32   `form:"book_score"`
	Start  time.Time `orm:"auto_now_add;type(datetime)";form:"book_start"`
	Finish time.Time `orm:"auto_now;type(datetime)";form:"book_end"`
}

func init() {
	orm.RegisterModel(new(Book))
}

func GetAll() *[]Book {
	bookList := new([]Book)
	num, err := orm.NewOrm().QueryTable("book").OrderBy("-finish").All(bookList)
	// num, err := orm.NewOrm().QueryTable("book").All(bookList)
	if err != nil {
		fmt.Printf("Error: Returned Rows Num: %d, %s", num, err)
	}
	return bookList
}

func GetBookById(id int) *Book {
	var book Book
	fmt.Println(id)
	err := orm.NewOrm().QueryTable("book").Filter("id", id).One(&book)
	if err != nil {
		fmt.Printf("%#v", err)
		return &book
	}
	return &book
}
