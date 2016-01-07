#!/bin/bash

# Usage: store-token-keychain.sh

# store a token in OS X Keychain and make it available as an environment variable
# must have token value before running script
# run script just once
# currently set up for use with GitHub personal access tokens, but easily adaptable to other use cases

set -e

echo -n "GitHub username: "
read username

echo -n "GitHub personal access token: "
read token

echo -n "environment variable name: "
read env_var

echo "Storing GitHub access token in keychain."
# security add-generic-password -s $env_var -a $username -w $token

echo "Configuring your .bashrc to get your access token from the keychain and put it in the $env_var environment variable"
# echo "export $env_var=\$(security find-generic-password -s $env_var -a $username -w)" >> ~/.bashrc
