#!/usr/bin/bash

export HISTSIZE=10000
export HISTTIMEFORMAT="%y-%m-%d %T "

. /etc/bash_colours
source /usr/share/git/completion/git-prompt.sh

# Force false terminal to get colour with (eg) ls within dvtm
# Disabled 2016-10-16: kiff doesn't have this problem.
#if [ "$TERM" == "dvtm-256color" ]; then 
#	TERM=rxvt-256color
#fi
if [ "$TERM" == "st-256color" ]; then
	# Quick fix for Del key in st
	echo $(tput smkx) > /dev/tty
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
elif [[ $(which tcc 2>/dev/null) && !$(which gcc 2>/dev/null) ]]; then
	export CC=tcc
fi

alias sudo="sudo "
alias monut=mount
alias pamcan=pacman
#alias scron="sudo EDITOR=nano crontab -e"
alias ls="/bin/ls --color=auto"
alias fimp="gimp"
alias sl=ls
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias xpdf="xpdf -cont"
alias feh="feh --magick-timeout=0"
alias xclip="xclip -selection c"


# u=rwx,g=,o=
umask 077

echo Running $(uname) $(uname -r) on $(uname -n) \($(uname -m)\)


if [ -f ~/todo ]; then
	echo To do:
	cat ~/todo
fi

if [ -f ~/.cache/weather/forecast ]; then
		echo ""
		echo Weather:
		cat ~/.cache/weather/forecast | while read -r l ; do echo " "$l ; done 
fi

[ -d ~/Maildir/new/ ] && [ "$(ls ~/Maildir/new/)" ] && echo 'New mail'
