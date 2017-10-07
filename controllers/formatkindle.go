package controllers

import(
	"booklist/helper"
	"github.com/astaxie/beego"
	"fmt"
)

type FormatController struct{
	beego.Controller
}
func (c *FormatController) Get(){
	s := "/home/wangc/go/src/booklist/clippings.txt"
	fmt.Println(s)
	helper.ClippingAll(s)
	c.TplName = "show.tpl"
}