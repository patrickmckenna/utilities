#!/bin/bash

# useage: set_terminal_title <title>
echo -ne "\033]0;"$@"\007"
