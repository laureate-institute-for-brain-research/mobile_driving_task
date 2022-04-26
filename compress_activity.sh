#!/bin/bash
npx --yes --package inline-source-cli inline-source --attribute "" --compress false --root ./build/web ./build/web/index.html > docs/index.html
#openssl base64 -in docs/index.ht
#
cat docs/index.html| base64 > docs/index.html.b64 