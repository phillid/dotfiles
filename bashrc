#!/usr/bin/bash

# Reset
Color_Off='\e[0m'
Colour_Off=${Color_Off}

# Regular Colors
Black='\e[0;30m'
Red='\e[0;31m'
Green='\e[0;32m'
Yellow='\e[0;33m'
Blue='\e[0;34m'
Purple='\e[0;35m'
Cyan='\e[0;36m'
White='\e[0;37m'

# Bold
BBlack='\e[1;30m'
BRed='\e[1;31m'
BGreen='\e[1;32m'
BYellow='\e[1;33m'
BBlue='\e[1;34m'
BPurple='\e[1;35m'
BCyan='\e[1;36m'
BWhite='\e[1;37m'

# Underline
UBlack='\e[4;30m'
URed='\e[4;31m'
UGreen='\e[4;32m'
UYellow='\e[4;33m'
UBlue='\e[4;34m'
UPurple='\e[4;35m'
UCyan='\e[4;36m'
UWhite='\e[4;37m'

# Background
On_Black='\e[40m'
On_Red='\e[41m'
On_Green='\e[42m'
On_Yellow='\e[43m'
On_Blue='\e[44m'
On_Purple='\e[45m'
On_Cyan='\e[46m'
On_White='\e[47m'

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
PS1="${BYellow}\
┌[${BGreen}\u${BYellow}@${BBlue}\h${BYellow}][${BPurple}\W${BYellow}"'$(__git_ps1 " (%s)")'"] ${BBlack}<\d \t>${BYellow}\n\
└╼ \[${Colour_Off}\]"
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
[ -f ~/.cache/XAGNZD ] && echo "$(cat ~/.cache/XAGNZD) (at $(date +"%a %d %H:%M" --date=@$(stat -c %Y ~/.cache/XAGNZD)))"
