#!/bin/sh
DIR=$(dirname "$0")
MSG=$(sed 's/\\/\\\\/g; s/"/\\"/g' "$DIR/banner.txt" 2>/dev/null | tr -d '\n')
printf '{"systemMessage":"\\u001b[38;5;46m%s\\u001b[0m"}\n' "$MSG"
