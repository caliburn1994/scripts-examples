#!/usr/bin/env bash
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. >/dev/null 2>&1 && pwd)"
CURRENT_DIR=$(dirname "$0")
BASENAME=$(basename "$0" | cut -f 1 -d '.')
TEMPLATE="${ROOT_DIR}/template/${BASENAME}.ttl"
TTL="${ROOT_DIR}/ttl/${BASENAME}.ttl"


# output
envsubst <"${TEMPLATE}" >"${TTL}"