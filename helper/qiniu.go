package helper

// 存储相关功能的引入包只有这两个，后面不再赘述
import (
	"context"
	"fmt"

	"github.com/qiniu/api.v7/auth/qbox"
	"github.com/qiniu/api.v7/storage"
)

var (
	accessKey = "your access key"
	secretKey = "your secret key"
	bucket    = "your image bucket"
	openUrl   = "your qiniu open url to show image"
)

func UploadFileToQiniu(localFile string) string {

	putPolicy := storage.PutPolicy{
		Scope: bucket,
	}
	mac := qbox.NewMac(accessKey, secretKey)
	upToken := putPolicy.UploadToken(mac)

	cfg := storage.Config{}
	// 空间对应的机房
	cfg.Zone = &storage.ZoneHuadong
	// 是否使用https域名
	cfg.UseHTTPS = false
	// 上传是否使用CDN上传加速
	cfg.UseCdnDomains = false

	// 构建表单上传的对象
	formUploader := storage.NewFormUploader(&cfg)
	ret := storage.PutRet{}

	// 可选配置
	putExtra := storage.PutExtra{
		Params: map[string]string{
			"x:name": "github logo",
		},
	}
	err := formUploader.PutFile(context.Background(), &ret, upToken, localFile, "/tmp/"+localFile, &putExtra)
	if err != nil {
		fmt.Println(err)
		return ""
	}
	//fmt.Println(ret.Key, ret.Hash)
	return openUrl + ret.Key
}
