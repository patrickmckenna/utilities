#!/bin/bash

# Usage: update-all.sh

set -e

softwareupdate -ia
mas upgrade

brew update
brew upgrade
brew cleanup
brew prune
brew bundle dump --force --file="$HOME/projects/dotfiles/Brewfile"

gem update

pip install --upgrade pip setuptools
pip3 install --upgrade pip setuptools wheel
pip list --outdated | cut -d \( -f 1 | xargs -n 1 pip install --upgrade
pip3 list --outdated | cut -d \( -f 1 | xargs -n 1 pip3 install --upgrade

# update Atom packages
apm upgrade -c false
