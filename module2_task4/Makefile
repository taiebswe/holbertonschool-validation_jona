GO=go
TARGET=awesome-api
RM=rm -f
MAKE=make
COVERAGE=coverage
HUGO=hugo

build:	## Generate the source code of the application to a binary.
	$(MAKE) lint
	$(GO) mod tidy
	$(GO) build -o $(TARGET)
	$(MAKE) check && $(HUGO)

run:	## Run the application in background by executing the binary.
	./$(TARGET) >./$(TARGET).log 2>&1 &

stop:	## Stop the application.
	@pkill $(TARGET)

clean:	## Stop the application. Delete the binary and the log file.
	@if pgrep -x $(TARGET) > /dev/null; then \
		pkill $(TARGET); \
	fi
	@$(RM) $(TARGET) $(TARGET).log $(COVERAGE)-units.out $(COVERAGE)-integrations.out *~

test:	## Test the application.
	$(MAKE) unit-tests
	$(MAKE) integration-tests

unit-tests: ## Run unit tests
	go test -v -short -coverprofile=$(COVERAGE)-units.out

integration-tests: ## Run integration tests
	go test -v -coverprofile=$(COVERAGE)-integrations.out

lint:	## Lint go lang code
	golangci-lint run

check:	## Lint markdonw source, check dead links
	markdownlint content/**/*.md
	find content -name \*.md -print0 | xargs -0 -n1 markdown-link-check

validate:	## Validate the file dist/index.html using the command line Holberton’s W3C Validator.
	python3 /opt/W3C-Validator/w3c_validator.py ./dist/index.html || true

help:	## Show this help usage.
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)
