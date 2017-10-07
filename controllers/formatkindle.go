package controllers

import (
	"booklist/helper"
	"fmt"

	"github.com/astaxie/beego"
)

type FormatController struct {
	beego.Controller
}

func (c *FormatController) Get() {
	s := "/tmp/clippings.txt"
	fmt.Println(s)
	helper.ClippingAll(s)
	c.TplName = "show.tpl"
}
