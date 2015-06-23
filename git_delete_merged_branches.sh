#!/bin/bash

# Usage: git_delete_merged_branches.sh
# delete all local branches that have been merged (skips currently checked-out branch)

set -e

git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
