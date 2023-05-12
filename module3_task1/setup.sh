#!/bin/bash

sudo apt-get update && sudo apt-get install -y make curl

# Download Hugo binary
HUGO_VERSION="0.84.0"
HUGO_BINARY="hugo_extended_${HUGO_VERSION}_Linux-64bit.deb"
curl -LO "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}"
sudo dpkg -i ${HUGO_BINARY}
rm ${HUGO_BINARY}

exit $?
