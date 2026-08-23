DREEGO = go run github.com/dreego-stack/dreego/cli/dreego

.PHONY: generate build run dev clean

generate:
	$(DREEGO) generate

build:
	$(DREEGO) generate
	go build -o bin/example-with-plugins .

run:
	$(DREEGO) generate
	go build -o bin/example-with-plugins .
	./bin/example-with-plugins

dev:
	$(DREEGO) dev

clean:
	rm -rf bin/
	find . -name 'dree.go' -delete