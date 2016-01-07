#!/bin/bash

# Usage: store-password.sh

# store a password in OS X Keychain and make it available as an environment variable
# must have token value before running script

set -e

echo -n "account name: "
read account_name

echo -n "password: "
read password

echo -n "environment variable name: "
read env_var

echo "Storing password in keychain."
security add-generic-password -s $env_var -a $account_name -w $password

echo "Configuring your .bashrc to make the password available as the environment variable: $env_var"
echo "export $env_var=\$(security find-generic-password -s $env_var -a $account_name -w)" >> ~/.bashrc
