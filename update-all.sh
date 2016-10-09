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

# keep the latest copy of Python docs available locally
cd "$HOME/Documents"
PYTHON3_VERSION=$(python3 -V | sed s/Python\ //)
ARCHIVED_DOCS="python-$PYTHON3_VERSION-docs-html.tar.bz2"
curl -O "https://docs.python.org/3/archives/$ARCHIVED_DOCS"
tar -xf "$ARCHIVED_DOCS"
rm "$ARCHIVED_DOCS"
