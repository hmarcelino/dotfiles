#!/bin/bash

# first configure command line
# Configure bash profile, ...
(cd cmdline && ./_install.sh)

# The install and configure applications
# install necessary applications, copy preferences, ...
(cd apps && ./_install.sh)

# Configure other applications
(cd confs && ./_install.sh)

git submodule init dev-utils
git submodule update dev-utils

# Install dev commands
git submodule init
cd dev-utils && ./install.sh
