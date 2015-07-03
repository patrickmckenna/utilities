#!/bin/bash

# Usage: cpp_check.sh <file>
# check C++ code for syntax errors

set -e

clang -fsyntax-only -std=c++1y -Wno-c++98-compat "$@"
