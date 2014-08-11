#!/bin/bash

echo "============================================="
echo "Installing hm commands"
echo "============================================="

INSTALLER_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if grep "hm init" ~/.bash_profile &>/dev/null ; then
   echo "hm commands are already installed in your ~/.bash_profile"
else
   echo "installed hm commands, have fun!"
   echo 'eval "$('$INSTALLER_DIR'/bin/hm init -)"' >> ~/.bash_profile
fi
