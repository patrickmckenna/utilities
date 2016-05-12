#!/bin/bash

# Usage: update-all.sh

set -e

brew update
brew upgrade
brew cleanup
brew prune

gem update

pip3 list | xargs -n 1 pip3 install --upgrade
