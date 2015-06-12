#!/bin/bash

# Usage: log_live.sh <required_arg> [<optional_arg>] [--optional-flag]
# brief description of the script's purpose

set -e

while :
do
  clear
  git --no-pager lga $*
  sleep 1
done
