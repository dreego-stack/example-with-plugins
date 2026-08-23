# example-with-plugins

Dreego demo application showcasing the plugin ecosystem. Uses three runtime
plugins (example, SSE, WebSocket) and documents how to add Tailwind CSS.

## Quick Start

```sh
go install github.com/dreego-stack/dreego/cli/dreego@latest

dreego generate

go build -o bin/app . && ./bin/app
```

Or use make:

```sh
make run
```

Open http://localhost:8080 in your browser.

## What You See

- **Homepage** (`/`) — live SSE and WebSocket demos with interactive examples
- **About** (`/about`) — explains the plugins
- **Greeting** (`/example/greet/World`) — from plugin-example
- **Health** (`/example/health`) — from plugin-example
- **SSE** (`/sse`) — Server-Sent Events streaming server time
- **WebSocket** (`/ws`) — WebSocket echo + broadcast

## Plugins

| Plugin | Endpoint | Description |
|--------|----------|-------------|
| plugin-example | `/example/greet/{name}` | Greeting endpoint |
| plugin-example | `/example/health` | Health check |
| plugin-sse | `/sse` | Server-Sent Events (server time every 2s) |
| plugin-websocket | `/ws` | WebSocket (echo + broadcast) |

## Optional: Tailwind CSS

```sh
go get github.com/dreego-stack/plugin-tailwind
sh $(go env GOMODCACHE)/github.com/dreego-stack/plugin-tailwind*/templates/setup.sh
dreego build
```

Then add `<link rel="stylesheet" href="/tailwind.css">` to the layout head.

## License

MPL-2.0