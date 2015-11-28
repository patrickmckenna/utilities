#!/bin/bash

# Usage: rewrite_commit_author.sh <required_arg> [<optional_arg>] [--optional-flag]
# brief description of the script's purpose

set -e

git filter-branch --env-filter '
  if test "$GIT_AUTHOR_EMAIL" = "patrickbm@github.com"
  then
    GIT_AUTHOR_EMAIL="trainingdemos+githubteacher@github.com"
    export GIT_AUTHOR_EMAIL
  fi
  if test "$GIT_AUTHOR_NAME" = "Patrick McKenna"
  then
    GIT_AUTHOR_NAME="githubteacher"
    export GIT_AUTHOR_NAME
  fi
  if test "$GIT_COMMITTER_EMAIL" = "patrickbm@github.com"
  then
    GIT_COMMITTER_EMAIL="trainingdemos+githubteacher@github.com"
    export GIT_COMMITTER_EMAIL
  fi
  if test "$GIT_COMMITTER_NAME" = "Patrick McKenna"
  then
    GIT_COMMITTER_NAME="githubteacher"
    export GIT_COMMITTER_NAME
  fi
' -- --all
