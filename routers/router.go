package routers

import (
	"booklist/controllers"

	"github.com/astaxie/beego"
)

func init() {
	// beego.Router("/", &controllers.MainController{})
	beego.Router("/", &controllers.ShowController{})
	beego.Router("/fmt", &controllers.FormatController{})
	beego.Router("/detail/:id([0-9]+)", &controllers.ShowController{}, "*:Detail")
	beego.Router("/list", &controllers.ShowController{}, "*:List")
	beego.Router("/list/add", &controllers.ShowController{}, "get:GetAdd;post:PostAdd")
	beego.Router("/list/edit/:id([0-9]+)", &controllers.ShowController{}, "get:GetEdit;post:PostEdit")

}
