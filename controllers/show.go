package controllers

import (
	"booklist/helper"
	"booklist/models"
	"sort"
	"time"

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
			tmp := make([]models.Book, 0)
			tmp = append(tmp, book)
			bList[int(month)] = tmp
		}
	}

	mList := make([]helper.MonthC, 0)
	for i := 1; i <= 12; i++ {
		tmpM := helper.MonthC{}
		if _, ok := bList[i]; ok {
			tmpM.N = i
			tmpM.E = time.Month(i)
			tmpM.C = helper.M2C(i)
			mList = append(mList, tmpM)
		}
	}
	s.Data["mList"] = mList
	sort.Sort(helper.MonthCList(mList))
	s.Data["mListDesc"] = mList

	// fmt.Printf("%+v\n", sort.Sort(helper.MonthCList(mList)))
	s.Data["bookList"] = bList
	s.TplName = "show.tpl"
}
