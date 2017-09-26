package controllers

import (
	"github.com/astaxie/beego"
)

type ShowController struct {
	beego.Controller
}

func (s *ShowController) Get() {
	s.TplName = "show.tpl"
}
