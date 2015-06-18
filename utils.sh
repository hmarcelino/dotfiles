#!/bin/bash

function createSymlink {
    INSTALLER_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";

    NOCOLOR="\033[0m"
    GREEN="\033[32m"
    YELLOW="\033[33m"

    SOURCE=$1
    TARGET=$2

    if [ -h $1 ]; then
        echo -e "${YELLOW}The $2 file is already a symbolic link. Removing it !${NOCOLOR}"
        rm $1

    elif [ -f $1 ] || [ -d $1 ]; then
        echo -e "${YELLOW}Backing up file $1 to $1.old !${NOCOLOR}"
        mv $1 $1.old
    fi

    ln -s $INSTALLER_DIR/$2 $1
    echo "Symbolic link created for file:"
    echo -e "${GREEN}    $1 -> $INSTALLER_DIR/$2 ${NOCOLOR}"
    echo ""
}

function printInfo {
    INFO="\033[34m"
    NOCOLOR="\033[0m"
    echo -e "${INFO}$1${NOCOLOR}"
}

function printSuccess {
    GREEN="\033[32m"
    NOCOLOR="\033[0m"
    echo -e "${GREEN}$1${NOCOLOR}"
}

function printWarning {
    YELLOW="\033[33m"
    NOCOLOR="\033[0m"
    echo -e "${YELLOW}$1${NOCOLOR}"
}

function printError {
    RED="\033[31m"
    NOCOLOR="\033[0m"
    echo -e "${RED}$1${NOCOLOR}"
}
