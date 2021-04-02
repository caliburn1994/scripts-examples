#!/usr/bin/env bash
CURRENT_DIR=$(dirname "$0")
BASENAME=$(basename "$0" | cut -f 1 -d '.')
TTL="${CURRENT_DIR}/${BASENAME}.ttl"


# data
export my_ip="192.168.0.111"
export my_username="xiaojie"
export my_password="mypassword"
export local_port=5432
export remote_port=5432


# tll file
cat << EOF > "${TTL}"
connect '${my_ip} /ssh /auth=password /user=${my_username} /passwd=${my_password} /ssh-L${local_port}:localhost:${remote_port}'
EOF

# run
 "/c/Program Files (x86)/teraterm/ttpmacro.exe"  "${TTL}"