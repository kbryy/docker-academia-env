# bash profile

# If not running interactively, don't do anything
# [ -z "$PS1" ] && return

HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --group-directories-first --color=auto'
	alias grep='grep --color=auto'
fi

if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi


if [ -f /etc/bash_completion.d/git-prompt ]; then
	export PS1='\n\[\033[01;32m\][\t] \033[01;33m\]\w \n\[\033[01;34m\]\[\033[00m\]\u$(__git_ps1) \$ '
fi


function my_cd(){
	\cd $@ && ls
}

function my_mkdir(){
	\mkdir $@ && ls
}

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias vim='nvim'
alias vi='vim'
alias emacs='vim'
alias nano='vim'

alias cd='my_cd'
alias mkdir='my_mkdir'
