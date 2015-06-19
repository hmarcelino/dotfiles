# dotFiles

It started to be a simple .files repository but it moved to something more. Now, it can also install the necessary applications. By executing the `_install.sh` script it will configure the machine making it reach the desired state.

My .files and configurations used. Fork it and adapt to your needs.

It has the following structure:

```
   + apps:    installation / settings of applications
     | - atom
     | - iterm2

   + cmdline: necessary files for the command line and enviorenment
   	 | - prompt
   	 | - completion
   	 | - exports
   	   ...

   + confs:   the place for several configurations like vim and git
   	 | - gitignore
   	 | - gitconfig
   	 | - vimrc

   + hm: hm command line. More info in https://github.com/basecamp/sub.

```

## Install

`cd && git clone git@github.com:hmarcelino/dotfiles.git && cd dotfiles && ./install.sh `

Currently this must be in your home folder.

That's it !

Restart your session and have some fun !
