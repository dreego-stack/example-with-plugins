FROM golang:1.22-alpine AS builder

RUN apk add --no-cache git musl-dev nodejs npm

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -o /usr/local/bin/dreego github.com/dreego-stack/dreego/cli/dreego

RUN npm install -D tailwindcss@3

RUN ./node_modules/.bin/tailwindcss -i tailwind-input.css -o www/static/tailwind.css --minify

RUN dreego generate

RUN CGO_ENABLED=0 go build -o /build/example-with-plugins .

FROM alpine:latest

COPY --from=builder /build/example-with-plugins /app/example-with-plugins

ENV PORT=3000
EXPOSE 3000

CMD ["/app/example-with-plugins"]