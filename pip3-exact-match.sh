#!/bin/bash

# Usage: pip-exact-match.sh package-name
# 
# Make pip3 search for an exact match of a package name,
# instead of matching on every phrase containing that name

set -e

pip3 search "$1" | grep -e "^$1 ("
