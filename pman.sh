#!/bin/bash

# view man pages in Preview
man -t ${@} | open -f -a /Applications/Preview.app/
