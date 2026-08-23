package main

import (
	"fmt"
	"log"
	"os"
	"time"

	dreego "github.com/dreego-stack/dreego/core"
	example "github.com/dreego-stack/plugin-example"
	sse "github.com/dreego-stack/plugin-sse"
	_ "github.com/dreego-stack/plugin-tailwind"
	ws "github.com/dreego-stack/plugin-websocket"

	"example-with-plugins/www"
)

func main() {
	app := dreego.New()

	if err := example.Register(app, example.Options{
		Prefix:        "/example",
		Greeting:      "Hello",
		EnableLogging: true,
	}); err != nil {
		log.Fatal(err)
	}

	if err := sse.Register(app, sse.Options{Path: "/sse"}); err != nil {
		log.Fatal(err)
	}

	if err := ws.Register(app, ws.Options{Path: "/ws"}); err != nil {
		log.Fatal(err)
	}

	if err := www.Register(app); err != nil {
		log.Fatal(err)
	}

	go broadcastLoop()

	addr := ":8080"
	if port := os.Getenv("PORT"); port != "" {
		addr = ":" + port
	}
	if err := app.Listen(addr); err != nil {
		log.Fatal(err)
	}
}

func broadcastLoop() {
	ticker := time.NewTicker(100 * time.Millisecond)
	defer ticker.Stop()
	for range ticker.C {
		msg := fmt.Sprintf("server time: %s", time.Now().Format("15:04:05"))
		sse.BrokerInstance().Broadcast("time", msg)
		ws.HubInstance().Broadcast([]byte(msg))
	}
}