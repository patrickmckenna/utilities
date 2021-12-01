#!/usr/bin/env bash
#/ Usage: script-name
#/
#/ Description
#/

set -e

# if help requested, print the comments at the top of the file
[[ "$1" =~ -h|(--)?help ]] && {
  grep "^#/" < "$0" | cut -c4-
  exit 0
}

echo "==> A relevant message"
