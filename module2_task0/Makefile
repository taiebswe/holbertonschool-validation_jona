GO=go
TARGET=awesome-api
RM=rm -f

build:
	$(GO) mod tidy
	$(GO) build -o $(TARGET)

run:
	./$(TARGET) >./$(TARGET).log 2>&1 &

stop:
	pkill $(TARGET)

clean:
	$(RM) $(TARGET) $(TARGET).log

test:
	@curl http://localhost:9999 http://localhost:9999/health
