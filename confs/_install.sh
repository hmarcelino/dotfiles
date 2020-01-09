#!/bin/bash

source ../utils.sh

echo "======================================================="
echo "Creating links "
echo "======================================================="

# # Creating symbolic link for git configuration file
createSymlink "$HOME/.gitconfig" "confs/gitconfig"
 
# # Creating symbolic link for git ignore configuration file
createSymlink "$HOME/.gitignore" "confs/gitignore"
 
# # Creating symbolic link for vim configuration file
createSymlink "$HOME/.vimrc" "confs/vimrc"
