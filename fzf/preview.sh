#!/bin/bash

if file "$1" | grep -qiE "text|json"; then
    command -v bat >/dev/null && bat --style=plain --paging=never "$1" || cat "$1"
else
    command -v hexyl >/dev/null && hexyl "$1" || hexdump -C "$1"
fi
