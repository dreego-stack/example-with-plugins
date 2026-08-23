# Agent Instructions for example-with-plugins

- Don't create binaries here — only in /tmp or ./tmp

## Language Rule

- **Chat with user:** German
- **Everything in this repository:** English

## What This Is

This is a **Dreego demo application** that showcases the plugin ecosystem. It
uses three runtime plugins (plugin-example, plugin-sse, plugin-websocket) and
documents how to add the build-time plugin-tailwind.

## Plugins Used

| Plugin | Type | Purpose |
|--------|------|---------|
| plugin-example | Runtime | Greeting + health endpoints |
| plugin-sse | Runtime | Server-Sent Events streaming |
| plugin-websocket | Runtime | WebSocket bidirectional communication |
| plugin-tailwind | Build-time (optional) | Tailwind CSS compilation |

## Development

```sh
make generate   # transpile .dreego -> Go
make build      # generate + go build
make run        # build + start server on :8080
make dev        # watch + rebuild + restart on change
```

## Coding Rules

- Max 300 lines per handwritten file
- No code comments (except where needed for clarity)
- Go 1.22+, prefer standard library
- .dreego files in www/routes/ and www/layouts/