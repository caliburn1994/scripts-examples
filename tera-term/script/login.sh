#!/usr/bin/env bash
temp_file=$(mktemp)

# data
export my_ip="192.168.0.180"
export my_username="xiaojie"
export my_password="mypassword"

# output as a ttl file and run
cat << EOF > "${temp_file}"
connect '${my_ip} /ssh /auth=password /user=${my_username} /passwd=${my_password}'
EOF
 "/c/Program Files (x86)/teraterm/ttpmacro.exe"  "${temp_file}"

trap 'rm -f "$temp_file";' EXIT