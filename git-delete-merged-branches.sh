#!/bin/bash

# Usage: git-delete-merged-branches.sh
# deletes all local branches, except for the default and the currently checked out branch(es), that have been merged into the default branch
# default here means GitHub default branch, not the target of refs/remotes/origin/HEAD
# assumes your remote is named "origin"
# asuumes you have a personal access token available via an environment variable called GITHUB_TOKEN
# assumes you have jq installed

set -e

remote_url=$(git remote get-url origin)
default_branch=$(curl -H "Authorization:token $GITHUB_TOKEN" https://api.github.com/repos/$remote_url | jq -r '.default_branch')

git branch --merged $default_branch | grep -v -e "\*" -e $default_branch | xargs -n 1 git branch -d

exit 0
