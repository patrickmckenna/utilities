#!/bin/bash

# Usage: git_delete_merged_branches.sh
# delete all local branches that have been merged (skips currently checked-out branch)

set -e

git branch --merged master | grep -v -e "\*" -e "^master" | xargs -n 1 git branch -d
