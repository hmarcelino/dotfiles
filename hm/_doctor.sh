#!/bin/bash

INSTALLER_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "============================================="
echo "Running hm doctor"
echo "============================================="

if ! command -v brew | grep "brew" &>/dev/null; then
    echo "brew is not installed"
    echo "Installing brew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "brew is already instelled."
    echo "Checking if all packages are installed."
fi

commands=("node" "git" "ansible")

for c in "${commands[@]}"
do
    if ! command -v $c | grep "$c" &>/dev/null; then
        brew install $c
    fi
done
