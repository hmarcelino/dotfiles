#!/usr/bin/env bash

source ../utils.sh

# based on https://www.freecodecamp.org/news/how-to-configure-your-macos-terminal-with-zsh-like-a-pro-c0ab3f3c1156/

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install theme powerlevel9k
mkdir -p ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# Install docker plugin
mkdir -p ~/.oh-my-zsh/custom/plugins/zsh-docker
git clone https://github.com/zsh-users/zsh-docker.git ~/.oh-my-zsh/custom/plugins/zsh-docker

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Creating symbolic link for git configuration file
createSymlink "$HOME/.zshrc" "zsh/zshrc"
createSymlink "$HOME/.p10k.zsh" "zsh/p10k.zsh"

