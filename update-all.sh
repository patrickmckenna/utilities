#!/bin/bash

# Usage: update-all.sh

set -e

BREWFILE="$HOME/.Brewfile"


softwareupdate --install --all
mas upgrade

brew update
brew upgrade
brew cleanup
brew prune
# update apps installed by Homebrew Cask; requires buo/homebrew-cask-upgrade
brew cu --all --yes --cleanup
brew bundle dump --force --file="$BREWFILE"

gem update
rbenv rehash

pip install --upgrade pip setuptools
pip3 install --upgrade pip setuptools wheel
pip list --outdated | cut -f 1 -d ' ' | grep --invert-match --extended-regexp --regexp="Package|-------" | xargs -n 1 pip install --upgrade
pip3 list --outdated | cut -f 1 -d ' ' | grep --invert-match --extended-regexp --regexp="Package|-------" | xargs -n 1 pip3 install --upgrade
pyenv rehash

# update Atom packages
apm upgrade --confirm false
