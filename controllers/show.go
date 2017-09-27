package controllers

import (
	"booklist/models"

	"github.com/astaxie/beego"
)

type ShowController struct {
	beego.Controller
}

func (s *ShowController) Get() {
	bookList := models.GetAll()
	//fmt.Printf("%+v", bookList)
	bList := make(map[int][]models.Book)
	for _, book := range *bookList {
		_, month, _ := book.Finish.Date()
		if b, ok := bList[int(month)]; ok {
			bList[int(month)] = append(b, book)
		} else {
			bList[int(month)] = make([]models.Book, 0)
		}
	}
	//fmt.Printf("%+v\n", (bList))
	s.Data["bookList"] = bList
	s.TplName = "show.tpl"
}
