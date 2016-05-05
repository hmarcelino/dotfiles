# dotFiles

It started to be a simple .files repository but it growth to be something more. Now, it can also setup a computer with the necessary applications. 
Executing the `install.sh` script it will configure the machine making it reach the desired state.

My .files and configurations used. Fork it and adapt to your needs.

It has the following structure:

```
   + apps:    installation / settings of applications
     | - atom
     | - iterm2
     | brew-pkgs.txt
     | cask-pkgs.txt
     | pip-pkgs.txt

   + cmdline: necessary files for the command line and environment
   	 | - prompt
   	 | - completion
   	 | - exports
   	   ...

   + confs:   the place for several configurations like vim and git
   	 | - gitignore
   	 | - gitconfig
   	 | - vimrc

   + hm: hm command line. More info in https://github.com/hmarcelino/sub

```

## Install

`cd && git clone git@github.com:hmarcelino/dotfiles.git && cd dotfiles && ./install.sh `

Currently this must be in your home folder.

That's it !

Restart your session and have some fun !
