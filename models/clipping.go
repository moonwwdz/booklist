package models

import (
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
