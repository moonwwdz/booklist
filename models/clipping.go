package models

import (
	"fmt"
	"time"

	"github.com/astaxie/beego/orm"
)

type Clipping struct {
	Id       int
	BookId   int
	BookName string
	Postion  string
	Content  string
	Comment  string
	MarkTime time.Time
}

func init() {
	orm.RegisterModel(new(Clipping))
}

// func GetContByName(name string) *[]Clipping {

// }

func AddClipping(c *Clipping) {
	orm.NewOrm().Insert(c)
}

func GetAllByBookName(s string) *[]*Clipping {
	var clipList []*Clipping
	qs := orm.NewOrm().QueryTable("clipping")
	num, err := qs.Filter("book_name", s).All(&clipList)
	if err != nil {
		fmt.Printf("%#v", err)
		return &clipList
	}

	if num < 1 {
		num, err = qs.Filter("book_name__contains", s).All(&clipList)
		if err != nil {
			fmt.Printf("%#v", err)
			return &clipList
		}
	}

	return &clipList
}
