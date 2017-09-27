package main

import (
	_ "booklist/routers"

	"booklist/helper"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	_ "github.com/mattn/go-sqlite3"
)

func init() {
	orm.RegisterDriver("sqlite3", orm.DRSqlite)
	orm.RegisterDataBase("default", "sqlite3", "data.db")
}
func main() {
	beego.SetStaticPath("/static", "static")
	beego.AddFuncMap("m2c", helper.M2C)
	beego.Run()
}
