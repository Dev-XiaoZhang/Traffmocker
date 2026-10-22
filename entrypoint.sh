#!/bin/sh
set -eu

if [ -z "${TOKEN:-}" ] || [ "$TOKEN" = "your_token_here" ]; then
    echo "Error: set TOKEN in .env before starting the container." >&2
    exit 1
fi

set -- start accept --token "$TOKEN"

if [ -n "${DEVICE_NAME:-}" ]; then
    set -- "$@" --device-name "$DEVICE_NAME"
fi

exec /usr/local/bin/cli "$@"