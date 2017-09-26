package main

import (
	_ "booklist/routers"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

func init() {
	orm.RegisterDriver("sqlite3", orm.DRSqlite)
	orm.RegisterDataBase("db", "sqlite3", "data.db")
}
func main() {
	beego.SetStaticPath("/static", "static")
	beego.Run()
}
