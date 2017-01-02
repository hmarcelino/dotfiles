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

echo "Installing Cask packages"
while read pkg; do
    if [[ ! $pkg = \#* ]]; then
        if [[ ! -d /opt/homebrew-cask/Caskroom/$pkg ]]; then
           echo "Installing package $pkg"
           brew cask install $pkg --appdir=/Applications 
       else
           printSuccess "$pkg is already installed";
       fi
    fi

done < cask-pkgs.txt
brew cask cleanup
echo ""

if ! command -v "pip" | grep "pip" &>/dev/null; then
    printWarning "No pip found Installing pip";
    sudo easy_install pip
else
    printSuccess "pip is installed"
fi

echo "Installing Pip packages"
while read pkg; do
    if [[ ! $pkg = \#* ]]; then
        echo "Installing package $pkg"
        sudo pip install $pkg --upgrade
    fi
done < pip-pkgs.txt
echo ""

echo "======================================================="
echo "Configuring applications."
echo "======================================================="

# Creating symbolic link for git configuration file
createSymlink "$HOME/.atom" "apps/atom"

# Creating symbolic link for iterm2 configuration file
createSymlink "$HOME/Library/Preferences/com.googlecode.iterm2.plist" "apps/com.googlecode.iterm2.plist"

# Creating symbolic link for vim plugins
createSymlink "$HOME/.vim" "apps/vim"

# Creating symbolic link Spectacle preferences
createSymlink "$HOME/Library/Application\ Support/Spectacle" "apps/spectacle"
