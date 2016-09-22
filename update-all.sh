#!/bin/bash

# Usage: update-all.sh

set -e

brew update
brew upgrade
brew cleanup
brew prune

gem update

pip install --upgrade pip setuptools
pip3 install --upgrade pip setuptools wheel
pip list --outdated | cut -d \( -f 1 | xargs -n 1 pip install --upgrade
pip3 list --outdated | cut -d \( -f 1 | xargs -n 1 pip3 install --upgrade
