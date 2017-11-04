package controllers

import (
	"booklist/helper"
	"booklist/models"
	"fmt"
	"os"
	"sort"
	"strconv"
	"time"

	"github.com/astaxie/beego/orm"

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

func (c *ShowController) Detail() {
	id := c.Ctx.Input.Param(":id")
	bookId, _ := strconv.Atoi(id)
	book := models.GetBookById(bookId)
	clippingList := models.GetAllByBookName(book.Name)

	// fmt.Printf("%+v\n", clippingList)
	c.Data["list"] = clippingList
	c.Data["bookname"] = book.Name
	c.TplName = "detail.tpl"
}

func (c *ShowController) List() {
	bookList := models.GetAll()
	c.Data["list"] = bookList
	c.TplName = "list.tpl"
}

func (c *ShowController) GetAdd() {
	c.TplName = "edit.tpl"
}

func (c *ShowController) PostAdd() {
	book := models.Book{}
	if err := c.ParseForm(&book); err != nil {
		fmt.Printf("%#v\n", err)
	}

	sTime := helper.UtcFormat(c.Input().Get("book_start"))
	eTime := helper.UtcFormat(c.Input().Get("book_end"))
	formatTime := "2006-01-02 15:04:05"
	loc, _ := time.LoadLocation("Local")
	book.Start, _ = time.ParseInLocation(formatTime, sTime, loc)
	book.Finish, _ = time.ParseInLocation(formatTime, eTime, loc)
	h, _ := time.ParseDuration("8h")
	book.Start = book.Start.Add(h)
	book.Finish = book.Start.Add(h)

	//upload img to server then upload it to qiniu
	f, handle, err := c.GetFile("book_img")
	if err != nil {
		// log.Fatal("getfile err ", err)
	} else {
		defer f.Close()
		fmt.Println(handle.Filename)
		c.SaveToFile("book_img", "/tmp/"+handle.Filename)
		imgUrl := helper.UploadFileToQiniu(handle.Filename)
		os.Remove("/tmp/" + handle.Filename)
		book.Url = imgUrl
	}

	_, err = orm.NewOrm().Insert(&book)
	if err != nil {
		fmt.Printf("%#v\n", err)
	}

	fmt.Printf("%#v\n", book)
	c.Redirect("/list", 302)
}

func (c *ShowController) GetEdit() {
	id := c.Ctx.Input.Param(":id")
	bookId, _ := strconv.Atoi(id)
	book := models.GetBookById(bookId)
	//	fmt.Printf("%#v\n", book)
	c.Data["book"] = book
	c.Data["editFlag"] = true
	c.TplName = "edit.tpl"
}

func (c *ShowController) PostEdit() {
	book := models.Book{}
	if err := c.ParseForm(&book); err != nil {
		fmt.Printf("%#v\n", err)
	}
	id := c.Ctx.Input.Param(":id")
	book.Id, _ = strconv.Atoi(id)
	//get time from utc time str,format it for normal
	sTime := helper.UtcFormat(c.Input().Get("book_start"))
	eTime := helper.UtcFormat(c.Input().Get("book_end"))
	formatTime := "2006-01-02 15:04:05"
	loc, _ := time.LoadLocation("Local")
	var err error
	book.Start, err = time.ParseInLocation(formatTime, sTime, loc)
	if err != nil {
		fmt.Printf("Start  Time : %#v\n", err)
	}
	//don't understand why have 8 hours have added to start
	h, _ := time.ParseDuration("8h")
	book.Start = book.Start.Add(h)
	book.Finish, err = time.ParseInLocation(formatTime, eTime, loc)
	if err != nil {
		fmt.Printf("Finish Time : %#v\n", err)
	}

	//upload img to server then upload it to qiniu
	f, handle, err := c.GetFile("book_img")
	if err != nil {
		// log.Fatal("getfile err ", err)
	} else {
		defer f.Close()
		fmt.Println(handle.Filename)
		c.SaveToFile("book_img", "/tmp/"+handle.Filename)
		imgUrl := helper.UploadFileToQiniu(handle.Filename)
		os.Remove("/tmp/" + handle.Filename)
		book.Url = imgUrl
	}
	_, err = orm.NewOrm().Update(&book)
	if err != nil {
		fmt.Printf("%#v\n", err)
	}
	// fmt.Printf("%#v\n", book)
	c.Redirect("/list/edit/"+id, 302)
}
