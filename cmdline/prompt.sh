# export CLICOLOR=1
# export LSCOLORS=gxfxcxdxbxegedabagacad
# export PS1="\[\033[1;33m \n[\t] imac:\W > \[\033[0m"

source /usr/local/etc/bash_completion.d/git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUPSTREAM=verbose

export PS1='[\h \W$(__git_ps1 " (%s)")]\$ '
