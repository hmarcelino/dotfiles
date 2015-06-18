#!/bin/bash

# first configure command line
# Configure bash profile, ...
(cd cmdline && ./_install.sh)

# The install and configure applications
# install necessary applications, copy preferences, ...
(cd apps && ./_install.sh)

# Configure other applications
(cd confs && ./_install.sh)

# Install hm commands
(cd hm && ./_install.sh)
