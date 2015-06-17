#!/bin/bash

source ../utils.sh


echo "======================================================="
echo "Installing applications"
echo "======================================================="

echo "Checking if Homebrew is installed"
if ! type brew > /dev/null; then
    echo "Homebrew is not installed. Installing it ..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    printSuccess "Homebrew is installed"
    brew update
    brew upgrade --all
fi
echo ""

echo "Installing Homebrew packages"
while read pkg; do
    echo "Installing package $pkg"
    brew install $pkg
done < brew-pkgs.txt
echo ""

echo "Installing Cask packages"
while read pkg; do
    echo "Installing package $pkg"
    brew install $pkg
done < brew-pkgs.txt
echo ""

echo "======================================================="
echo "Configuring applications."
echo "======================================================="

# Creating symbolic link for git configuration file
createSymlink "$HOME/.atom" "apps/atom"

# Creating symbolic link for iterm2 configuration file
createSymlink "/Users/hugomarcelino/Library/Preferences/com.googlecode.iterm2.plist" "apps/com.googlecode.iterm2.plist"
