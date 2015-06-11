#!/bin/bash

# Usage: rewrite_commit_author.sh <required_arg> [<optional_arg>] [--optional-flag]
# brief description of the script's purpose

set -e

git filter-branch --env-filter '
  if test "$GIT_AUTHOR_EMAIL" = "patrickbm@github.com"
  then
    GIT_AUTHOR_EMAIL="patrick.b.mckenna@gmail.com"
    export GIT_AUTHOR_EMAIL
  fi
  if test "$GIT_COMMITTER_EMAIL" = "patrickbm@github.com"
  then
    GIT_COMMITTER_EMAIL="patrick.b.mckenna@gmail.com"
    export GIT_COMMITTER_EMAIL
  fi
' -- --all
