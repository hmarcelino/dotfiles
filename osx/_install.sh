#!/bin/bash

source ../utils.sh

echo "======================================================="
echo "Configuring your command line environment"
echo "======================================================="

# Creating symbolic link for git configuration file
createSymlink "$HOME/.bash_profile" "osx/bash_profile"

echo "======================================================="
echo "Configuring your osx environment"
echo "======================================================="
