#!/bin/bash

# Install powerline which is not something easy but valuable
# Based on http://khanh-ng.blogspot.pt/2015/02/install-powerline-for-mac-os-x.html

source ../utils.sh

####################
# Install powerline
####################

pip install git+git://github.com/Lokaltog/powerline

POWERLINE_PATH=~/Library/Python/2.7/lib/python/site-packages/
git clone https://github.com/powerline/powerline.git
cp -r powerline/powerline/ $POWERLINE_PATH/powerline
cp -r powerline/scripts/ $POWERLINE_PATH/powerline/scripts

####################
# Install fonts
####################
git clone https://github.com/powerline/fonts.git /tmp/powerline-fonts \
    && /tmp/powerline-fonts/install.sh \
    && rm -f /tmp/powerline-fonts
