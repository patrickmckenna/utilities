#!/bin/bash

set -e

https_url="https:\/\/github.com\/"
ssh_url="git@github.com:"
remote_name="origin"
user_repo=$(git remote get-url $remote_name | sed s/$https_url// | sed s/$ssh_url// | sed s/.git//)

default_branch=$(curl -sH "Authorization:token $GITHUB_TOKEN" https://api.github.com/repos/$user_repo | jq -r '.default_branch')

git branch --merged $default_branch | grep -v -e "\*" -e $default_branch | xargs -n 1 git branch -d

exit 0
