#!/bin/bash

apt-get update && apt-get install -y make curl

# Download Hugo binary
HUGO_VERSION="0.84.0"
HUGO_BINARY="hugo_extended_${HUGO_VERSION}_Linux-64bit.deb"
curl -LO "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}"
          https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_v${HUGO_VERSION}_Linux-64bit.deb
dpkg -i ${HUGO_BINARY}
rm ${HUGO_BINARY}

make build
exit $?
