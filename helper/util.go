package helper

import "math/rand"

var imgSize = map[int]string{1: "ss-small", 2: "ss-medium", 3: "ss-large"}

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
