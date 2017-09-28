package helper

import (
	"time"
)

var m2c = map[int]string{1: "壹月", 2: "贰月", 3: "叁月", 4: "肆月", 5: "伍月", 6: "陆月", 7: "柒月", 8: "捌月", 9: "玖月", 10: "拾月", 11: "拾壹", 12: "拾贰"}

type MonthC struct {
	N int
	E time.Month
	C string
}

type MonthCList []MonthC

func (m MonthCList) Len() int {
	return len(m)
}
func (m MonthCList) Swap(i, j int) {
	m[i], m[j] = m[j], m[i]
}
func (m MonthCList) Less(i, j int) bool {
	return m[i].N > m[j].N
}

func M2C(month int) string {
	if c, ok := m2c[month]; ok {
		return c
	}
	return ""
}
