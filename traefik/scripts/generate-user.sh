#!/bin/bash

set -e

RES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/../res"
USERS_PATH="$RES_DIR/users"

pushd . > /dev/null

[[ ! -d $RES_DIR ]] && mkdir "$RES_DIR"

while ! type htpasswd > /dev/null; do
    echo 'WARN: apache2-utils is not installed on your system. Unable to use htpasswd' >&2
    echo 'Trying to install the apache2-utils, root permissions may be required...'
    sudo apt install -y apache2-utils > /dev/null
    break
done

USERNAME=$(shuf -n1 /usr/share/dict/american-english || echo -n "admin")
PASSWORD=$(openssl rand -base64 24)

htpasswd -nb "$USERNAME" "$PASSWORD" > "$USERS_PATH"

echo -e "User: $USERNAME\nPassword: $PASSWORD\n"
echo "User saved to $USERS_PATH"

popd > /dev/null
