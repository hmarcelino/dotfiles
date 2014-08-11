#!/bin/bash

source ../utils.sh

echo "======================================================="
echo "Configuring applications."
echo "======================================================="

# Creating symbolic link for git configuration file
createSymlink "$HOME/.atom" "apps/atom"

# Creating symbolic link for iterm2 configuration file
createSymlink "/Users/hugomarcelino/Library/Preferences/com.googlecode.iterm2.plist" "apps/com.googlecode.iterm2.plist"
