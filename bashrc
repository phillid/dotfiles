#!/usr/bin/bash

. /etc/bash_colours
source /usr/share/git/completion/git-prompt.sh

# Force false terminal to get colour with (eg) ls within dvtm
if [ "$TERM" == "dvtm-256color" ]; then 
	TERM=rxvt-256color
	# Quick fix for readline Del key in st
	# disabled 2016-01-21
	#echo $(tput smkx) > /dev/tty
fi

man() {
        env LESS_TERMCAP_mb=$'\E[01;31m' \
        LESS_TERMCAP_md=$'\E[01;38;5;74m' \
        LESS_TERMCAP_me=$'\E[0m' \
        LESS_TERMCAP_se=$'\E[0m' \
        LESS_TERMCAP_so=$'\E[38;5;246m' \
        LESS_TERMCAP_ue=$'\E[0m' \
        LESS_TERMCAP_us=$'\E[04;38;5;146m' \
        man "$@"
}
###############
PS1="${BYellow}\
┌[${BGreen}\u${BYellow}@${BBlue}\h${BYellow}][${BPurple}\W${BYellow}"'$(__git_ps1 " (%s)")'"] ${BBlack}<\d \t>${BYellow}\n\
└╼ \[${Colour_Off}\]"
###############
export GPG_TTY=$(tty)
export EDITOR=/usr/bin/vim
if [ $(which clang 2>/dev/null) ]; then
	export CC=clang
	export CXX=clang
fi

alias sudo="sudo "
alias monut=mount
alias pamcan=pacman
#alias scron="sudo EDITOR=nano crontab -e"
alias ls="/bin/ls --color=auto"
alias sl=ls
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias xpdf="xpdf -cont"
alias feh="feh --magick-timeout=0"
alias xclip="xclip -selection c"

echo Running $(uname) $(uname -r) on $(uname -n) \($(uname -m)\)


if [ -f ~/todo ]; then
	echo To do:
	cat ~/todo
else
	echo To do list empty
fi

if [ -f ~/.cache/weather/forecast ]; then
		echo ""
		echo Weather:
		cat ~/.cache/weather/forecast | while read -r l ; do echo " "$l ; done 
fi
