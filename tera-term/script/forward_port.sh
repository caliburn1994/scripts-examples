#!/usr/bin/env bash
temp_file=$(mktemp)


# data
export my_ip="192.168.0.180"
export my_username="xiaojie"
export my_password="mypassword"
export local_port=5432
export remote_port=5432


# output as a ttl file and run
cat << EOF > "${temp_file}"
connect '${my_ip} /ssh /auth=password /user=${my_username} /passwd=${my_password} /ssh-L${local_port}:localhost:${remote_port}'
EOF
 "/c/Program Files (x86)/teraterm/ttpmacro.exe"  "${temp_file}"

 trap 'rm -f "$temp_file";' EXIT