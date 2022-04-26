#!/bin/bash
npx --yes --package inline-source-cli inline-source --attribute "" --compress true --root ./build/web ./build/web/index.html > docs/index.html
openssl base64 -in docs/index.html -out docs/index.html.b64