#!/usr/bin/env bash
#/ Usage: script-name
#/
#/ Description
#/

set -e

# if help requested, print the comments at the top of the file
if [[ "$1" == "--help" || "$1" == "-h" || "$1" == "help" ]]; then
  grep "^#/" < "$0" | cut -c4-
  exit 0
fi

echo "==> A relevant message"
