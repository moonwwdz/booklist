package routers

import (
	"booklist/controllers"

	"github.com/astaxie/beego"
)

func init() {
	// beego.Router("/", &controllers.MainController{})
	beego.Router("/", &controllers.ShowController{})
}
