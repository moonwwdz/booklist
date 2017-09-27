package helper

var m2c = map[int]string{1: "一月", 2: "二月", 3: "三月", 4: "四月", 5: "五月", 6: "六月", 7: "七月", 8: "八月", 9: "九月", 10: "十月", 11: "十一", 12: "十二"}

func M2C(month int) string {
	if c, ok := m2c[month]; ok {
		return c
	} else {
		return ""
	}
}
