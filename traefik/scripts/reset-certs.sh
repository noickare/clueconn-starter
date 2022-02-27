#!/bin/bash

set -e

RES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/../res"
CERTS_FILE_PATH="$RES_DIR/acme.json"

pushd . > /dev/null

[[ ! -d $RES_DIR ]] && mkdir "$RES_DIR"

rm "$CERTS_FILE_PATH" 2> /dev/null || true
touch "$CERTS_FILE_PATH"
chmod 600 "$CERTS_FILE_PATH"

echo "The new certificates file was created."

popd > /dev/null
