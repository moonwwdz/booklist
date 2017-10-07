package helper

import (
	"booklist/models"
	"bufio"
	"fmt"
	"io"
	"io/ioutil"
	"os"
	"regexp"
	"strings"
	"time"
)

const END_CLIP = "=========="

//单行循环
func ClippingLine(path string) {
	f, err := os.Open(path)
	if err != nil {
		fmt.Printf("%v\n", err)
		os.Exit(1)
	}
	defer f.Close()

	var i = 0
	var nameFlag = false
	var noteFlag = false
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
		fmt.Printf("%+v", line)
		if len(line) == 0 {
			// fmt.Println(line)
			continue
		} else if strings.Contains(line, "标注") {
			clipping.Postion, clipping.MarkTime = formatClip(line)
			// fmt.Println(clipping.Postion)
			// fmt.Println(clipping.MarkTime)
			// fmt.Println(line)
		} else if strings.Contains(line, "笔记") {
			//clipping.Comment = line
			noteFlag = true
		} else if strings.Compare(END_CLIP, line) == 0 {
			//遇到======一个标记完成，入库
			fmt.Printf("%+v\n", clipping)
			//models.AddClipping(clipping)
			//它的下一行为书名
			nameFlag = true
			//清空对象
			clipping = &models.Clipping{}
		} else {
			if nameFlag {
				fmt.Println(line)
				clipping.BookName = line
				nameFlag = false
			} else {
				if noteFlag {
					clipping.Comment = line
					noteFlag = false
				} else {
					clipping.Content = line
				}
			}
		}
		i++
	}
}

func ClippingAll(p string) {
	fi, err := os.Open(p)
	if err != nil {
		fmt.Printf("%+v", err)
	}
	defer fi.Close()

	fd, err := ioutil.ReadAll(fi)
	if err != nil {
		fmt.Printf("%v", err)
	}

	listClipping := strings.Split(string(fd), END_CLIP)
	clipping := new(models.Clipping)
	for _, c := range listClipping {
		// fmt.Printf("%#v\n",c)
		listC := strings.Split(c, "\r\n")
		if strings.Contains(c, "笔记") {
			clipping.Comment = strings.Join(listC[3:], "\r\n")
			continue
		}
		//过滤书签
		if len(listC) <= 2 {
			continue
		}
		clipping.Content = strings.Join(listC[3:], "\r\n")
		clipping.BookName = listC[1]
		// for i,b := range listC{
		// 	fmt.Printf("%v:%+v\n",i,b)
		// }
		//fmt.Println(len(listC))

		clipping.Postion, clipping.MarkTime = formatClip(listC[2])

		// fmt.Printf("%#v\n", clipping)
		models.AddClipping(clipping)
		//清空对象
		clipping = &models.Clipping{}

	}
}

//取位置和时间
func formatClip(s string) (string, time.Time) {
	regPost := regexp.MustCompile(`#\d{1,8}-\d{1,8}|#\d{1,8}`)
	regTimeY := regexp.MustCompile(`\d{4}年\d{1,2}月\d{1,2}日`)
	regTimeH := regexp.MustCompile(`[^\x00-\xff]{2}\d{1,2}:\d{1,2}:\d{1,2}`)
	regTimeh := regexp.MustCompile(`\d{1,2}:\d{1,2}:\d{1,2}`)
	regReplace := regexp.MustCompile(`[年|月|日]`)
	//提取位置
	postion := regPost.FindString(s)
	//提取年月
	tY := regTimeY.FindString(s)
	//提取中文时间
	tH := regTimeH.FindString(s)
	//提取英文时间
	th := regTimeh.FindString(s)
	//替换中文日期中的[年月日]为[-]
	tY = regReplace.ReplaceAllString(tY, "-")
	tY = strings.TrimSuffix(tY, "-")
	timeF := "2006-1-2 15:04:05"
	now, err := time.Parse(timeF, tY+" "+th)
	if err != nil {
		fmt.Printf("%+v\n", err)
	}

	if strings.Contains(tH, "下午") {
		h, _ := time.ParseDuration("12h")
		now = now.Add(h)
	}

	return postion, now
}
