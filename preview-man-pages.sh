#!/bin/bash

# Useage: preview-man-pages <command>
# Open man pages in Preview

set -e

man -t ${@} | open -f -a /Applications/Preview.app/
