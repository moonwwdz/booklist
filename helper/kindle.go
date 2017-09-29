package helper

import (
	"booklist/models"
	"bufio"
	"fmt"
	"io"
	"os"
	"regexp"
	"strings"
	"time"
)

const END_CLIP = "==========\n"

func Clipping(path string) {
	f, err := os.Open(path)
	if err != nil {
		fmt.Printf("%v\n", err)
		os.Exit(1)
	}
	defer f.Close()

	var i = 0
	var nameFlag = false
	br := bufio.NewReader(f)
	clipping := new(models.Clipping)
	for {
		if i > 50 {
			break
		}

		line, err := br.ReadString('\n')
		if err == io.EOF {
			break
		}
		if len(line) == 0 {
			continue
		} else if strings.Contains("标注", line) {

		} else if strings.Contains("笔记", line) {
			clipping.Comment = line
		} else if strings.Compare(END_CLIP, line) != 0 {
			//遇到======一个标记完成，入库
			models.AddClipping(clipping)
			//它的下一行为书名
			nameFlag = true
			//清空对象
			clipping = &models.Clipping{}
		} else {
			if nameFlag {
				clipping.BookName = line
			} else {
				clipping.Content = line
			}
		}
		i++
	}
}

func formatClip(s string) (string, time.Time) {
	regPost := regexp.MustCompile(`#\d{4}-\d{4}`)
	regTimeY := regexp.MustCompile(`\d{4}年\d{1,2}月\d{1,2}日`)
	regTimeH := regexp.MustCompile(`[^\x00-\xff]{2}\d{1,2}:\d{1,2}:\d{1,2}`)
	regTimeh := regexp.MustCompile(`\d{1,2}:\d{1,2}:\d{1,2}`)

	postion := regPost.FindString(s)
	tY := regTimeY.FindString(s)
	tH := regTimeH.FindString(s)
	th := regTimeh.FindString(s)

	timeF := "2006-01-02 15:04:05"
	now, err := time.Parse(timeF, tY+" "+th)
	if err != nil {
		fmt.Printf("%+v\n", err)
	}

	if strings.Contains("下午", tH) {
		h, _ := time.ParseDuration("12h")
		now = now.Add(h)
	}

	return postion, now
}
