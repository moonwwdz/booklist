package helper

import (
	"math/rand"
	"time"
)

var imgSize = map[int]string{1: "ss-small", 2: "ss-medium", 3: "ss-large"}
var weekList = map[int]string{
	0: "星期天",
	1: "星期一",
	2: "星期二",
	3: "星期三",
	4: "星期四",
	5: "星期五",
	6: "星期六"}

func RandSize() string {
	i := rand.Intn(3)
	if s, ok := imgSize[i+1]; ok {
		return s
	}
	return imgSize[3]
}

func LR(i int) bool {
	if i%2 == 0 {
		return true
	}
	return false
}

func Add(i int) int {
	return i + 1
}

func Time2Week(t time.Time) string {
	if s, ok := weekList[int(t.Weekday())]; ok {
		return s
	}
	return t.Weekday().String()

}
