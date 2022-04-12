#!/bin/bash

source ../utils.sh


echo "======================================================="
echo "Installing applications"
echo "======================================================="

echo "Checking if Homebrew is installed"
if ! command -v "brew" | grep "brew" &>/dev/null; then
    printError "Homebrew is not installed. Installing it ..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    printSuccess "Homebrew is installed"
    printInfo "Updating and upgrading brew"
    brew update
    brew upgrade
fi
echo ""

echo "Installing Homebrew packages"
while read pkg; do
    if [[ ! $pkg = \#* ]]; then
        echo "Installing package $pkg"
        brew install $pkg
    fi
done < brew-pkgs.txt
echo ""

brew tap caskroom/versions
brew tap caskroom/fonts
 
echo "======================================================="
echo "Configuring applications."
echo "======================================================="
 
# Creating symbolic link for vim plugins
createSymlink "$HOME/.vim" "apps/vim"
 
# Creating symbolic link Spectacle preferences
# createSymlink "$HOME/Library/Application\ Support/Spectacle" "apps/spectacle"
