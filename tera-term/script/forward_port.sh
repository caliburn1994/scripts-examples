#!/usr/bin/env bash
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. >/dev/null 2>&1 && pwd)"
CURRENT_DIR=$(dirname "$0")
BASENAME=$(basename "$0" | cut -f 1 -d '.')
TTL="${ROOT_DIR}/ttl/${BASENAME}.ttl"


# data
export my_ip="192.168.0.111"
export my_username="xiaojie"
export my_password="mypassword"
export local_port=5432
export remote_port=5432


# output
cat << EOF > "${TTL}"
connect '${my_ip} /ssh /auth=password /user=${my_username} /passwd=${my_password} /ssh-L${local_port}:localhost:${remote_port}'
EOF