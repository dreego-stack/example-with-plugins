FROM golang:1.22-alpine AS builder

RUN apk add --no-cache git make musl-dev

WORKDIR /build

COPY dreego/ ./dreego/
COPY plugin-example/ ./plugin-example/
COPY plugin-sse/ ./plugin-sse/
COPY plugin-websocket/ ./plugin-websocket/
COPY example-with-plugins/ ./example-with-plugins/

WORKDIR /build/example-with-plugins

RUN go mod tidy

RUN cd /build/dreego && go build -o /usr/local/bin/dreego ./cli/dreego

RUN dreego generate

RUN CGO_ENABLED=0 go build -o /app/example-with-plugins .

FROM alpine:latest

COPY --from=builder /app/example-with-plugins /app/example-with-plugins

ENV PORT=3000
EXPOSE 3000

CMD ["/app/example-with-plugins"]