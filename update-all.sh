#!/bin/bash

# Usage: update-all.sh

set -e

softwareupdate -ia
mas upgrade

brew update
brew upgrade
brew cleanup
brew prune
cd "$HOME/projects/dotfiles"
brew bundle dump --force

gem update

pip install --upgrade pip setuptools
pip3 install --upgrade pip setuptools wheel
pip list --outdated | cut -d \( -f 1 | xargs -n 1 pip install --upgrade
pip3 list --outdated | cut -d \( -f 1 | xargs -n 1 pip3 install --upgrade

# update Atom packages
apm upgrade -c false

# keep the latest copy of Python, MySQL docs available locally
DOCS_HOME="$HOME/Documents"
cd "$DOCS_HOME"

PYTHON3_VERSION=$(python3 -V | sed s/Python\ //)
PYTHON_DOWNLOAD="python-$PYTHON3_VERSION-docs-html.tar.bz2"
curl -O "https://docs.python.org/3/archives/$PYTHON_DOWNLOAD"
tar -xf "$PYTHON_DOWNLOAD"
rm "$PYTHON_DOWNLOAD"

MYSQL_VERSION="5.6"
MYSQL_DOCS_BASEURL="http://downloads.mysql.com/docs/"
MYSQL_DOCS="refman-$MYSQL_VERSION-en."
MYSQL_HTML_DOCS="${MYSQL_DOCS}html-chapter.tar.gz"
MYSQL_PDF_DOCS="${MYSQL_DOCS}pdf"
curl -O "$MYSQL_DOCS_BASEURL$MYSQL_HTML_DOCS"
curl -O "$MYSQL_DOCS_BASEURL$MYSQL_PDF_DOCS"
tar -xf "$MYSQL_HTML_DOCS"
rm "$MYSQL_HTML_DOCS"
