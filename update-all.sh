#!/bin/bash

# Usage: update-all.sh

set -e

brew update && brew upgrade && brew cleanup && brew prune

gem update
