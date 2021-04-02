#!/usr/bin/env bash
CURRENT_DIR=$(dirname "$0")
BASENAME=$(basename "$0" | cut -f 1 -d '.')
TTL="${CURRENT_DIR}/${BASENAME}.ttl"


# tll file
cat << EOF > "${TTL}"
connect '127.0.0.1:2222 /ssh /auth=publickey /user=vagrant /keyfile=${CURRENT_DIR}\.vagrant\machines\default\virtualbox\private_key /ssh-L5432:localhost:5432'
EOF

# run
 "/c/Program Files (x86)/teraterm/ttpmacro.exe"  "${TTL}"