package main

import (
	"flag"
	"fmt"
	"net/http"
	"os"
	"strconv"
)

var (
	ConfigSource string
	WebPort      int
	WebPath      string
)

func init() {
	flag.StringVar(&ConfigSource, "c", "default", "config source default or env.")
	flag.IntVar(&WebPort, "port", 8080, "web port.")
	flag.StringVar(&WebPath, "path", "./www", "web path.")
	flag.Parse()

	if ConfigSource == "env" {
		WebPort = getEnvInt("WEB_PORT", WebPort)
		WebPath = getEnvString("WEB_PATH", WebPath)
	}
}

func main() {

	fmt.Printf("File Server Port:%d Path:%s", WebPort, WebPath)

	http.Handle("/", http.FileServer(http.Dir(WebPath)))
	err := http.ListenAndServe(fmt.Sprintf(":%d", WebPort), nil)
	if err != nil {
		fmt.Printf(err.Error())
	}
}

func getEnvString(name string, value string) string {
	ret := os.Getenv(name)
	if ret == "" {
		return value
	} else {
		return ret
	}
}

func getEnvInt(name string, value int) int {
	env := os.Getenv(name)
	if ret, err := strconv.Atoi(env); env == "" || err != nil {
		return value
	} else {
		return ret
	}
}
