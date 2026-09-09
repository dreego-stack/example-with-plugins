module example-with-plugins

go 1.22

require (
	github.com/dreego-stack/dreego v0.6.4
	github.com/dreego-stack/dreego-ui v0.0.0
	github.com/dreego-stack/plugin-example v0.0.1
	github.com/dreego-stack/plugin-sse v0.0.2
	github.com/dreego-stack/plugin-tailwind v0.0.1
	github.com/dreego-stack/plugin-websocket v0.0.1
)

require golang.org/x/text v0.22.0 // indirect

replace github.com/dreego-stack/dreego-ui => ../dreego-ui
