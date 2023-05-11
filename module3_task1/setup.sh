#!/bin/bash

apt-get update && apt-get install -y make curl build-essential

GO_VERSION="1.15.7"
CGO_ENABLED=1
GO11MODULES=on
curl --silent --show-error --location --output /tmp/go.tgz \
     "https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz" \
   && tar -C /usr/local -xzf /tmp/go.tgz \
   && rm -f /tmp/go.tgz

cp /usr/local/go/bin/go /usr/local/bin

# Download Hugo binary
HUGO_VERSION="0.84.0"
HUGO_BINARY="hugo_extended_${HUGO_VERSION}_Linux-64bit.deb"
curl -LO "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}"
dpkg -i ${HUGO_BINARY}
rm ${HUGO_BINARY}

GOLANGCILINT_VERSION="1.52.2"
curl --silent --show-error --location --output /tmp/golangci-lint.deb \
     "https://github.com/golangci/golangci-lint/releases/download/v${GOLANGCILINT_VERSION}/golangci-lint-${GOLANGCILINT_VERSION}-linux-amd64.deb"
dpkg -i /tmp/golangci-lint.deb
rm -f /tmp/golangci-lint.deb

exit $?
