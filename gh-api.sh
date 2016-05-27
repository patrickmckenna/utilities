#!/bin/bash

# Usage: gh-api.sh <endpoint>
# hit GitHub's API w/ an authenticated request

set -e

curl -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/$1
