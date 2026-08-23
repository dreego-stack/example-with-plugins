module example-with-plugins

go 1.22

require (
	github.com/dreego-stack/dreego v0.0.71
	github.com/dreego-stack/plugin-example v0.0.0
	github.com/dreego-stack/plugin-sse v0.0.0
	github.com/dreego-stack/plugin-websocket v0.0.0
)

replace github.com/dreego-stack/dreego => ../dreego

replace github.com/dreego-stack/plugin-example => ../plugin-example

replace github.com/dreego-stack/plugin-sse => ../plugin-sse

replace github.com/dreego-stack/plugin-websocket => ../plugin-websocket
