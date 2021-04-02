#!/usr/bin/env bash
CURRENT_DIR=$(dirname "$0")
BASENAME=$(basename "$0" | cut -f 1 -d '.')
TTL="${CURRENT_DIR}/${BASENAME}.ttl"


# data
export my_ip="192.168.0.111"
export my_username="xiaojie"
export my_password="mypassword"

# ttl files
cat << EOF > "${TTL}"
connect '${my_ip} /ssh /auth=password /user=${my_username} /passwd=${my_password}'
EOF

# run
 "/c/Program Files (x86)/teraterm/ttpmacro.exe"  "${TTL}"