#!/usr/bin/bash

c_off='\e[0m'
c_bold='\e[1m'
c_black='\e[30m'
c_red='\e[31m'
c_green='\e[32m'
c_yellow='\e[33m'
c_blue='\e[34m'
c_purple='\e[35m'
c_cyan='\e[36m'
c_white='\e[37m'

export HISTSIZE=10000
export HISTTIMEFORMAT="%y-%m-%d %T "

source /usr/share/git/completion/git-prompt.sh

# Force false terminal to get colour with (eg) ls within dvtm
if [ "$TERM" == "dvtm-256color" ]; then 
	TERM=rxvt-256color
fi
if [ "$TERM" == "st-256color" ]; then
	# Quick fix for ctrl+arrow key in st
	echo $(tput smkx) > /dev/tty
fi

###############
PS1="${c_bold}${c_yellow}\
┌[${c_green}\u${c_yellow}@${c_blue}\h${c_yellow}][${c_purple}\W${c_yellow}"'$(__git_ps1 " (%s)")'"] ${c_black}<\d \t>${c_yellow}\n\
└╼ \[${c_off}\]"
###############

source ~/.aliases
source ~/.environment

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

[ -z "$(ls -A ~/.cache/currency 2>/dev/null)" ] || for c in ~/.cache/currency/* ; do
	echo "$(cat $c) (at $(date +"%a %d %H:%M" --date=@$(stat -c %Y $c)))"
done
