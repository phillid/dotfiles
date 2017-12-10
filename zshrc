zstyle ':completion:*' completer _expand _complete _ignored

autoload -Uz compinit
compinit

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=100000

# no beeping ಠ_ಠ
unsetopt beep

# cd -> pushd
setopt auto_pushd

# key binding based on zsh wiki
typeset -A key

key[Home]="$terminfo[khome]"
key[End]="$terminfo[kend]"
key[Insert]="$terminfo[kich1]"
key[Backspace]="$terminfo[kbs]"
key[Delete]="$terminfo[kdch1]"

# setup key accordingly
[[ -n "$key[Home]"      ]] && bindkey -- "$key[Home]"      beginning-of-line
[[ -n "$key[End]"       ]] && bindkey -- "$key[End]"       end-of-line
[[ -n "$key[Insert]"    ]] && bindkey -- "$key[Insert]"    overwrite-mode
[[ -n "$key[Backspace]" ]] && bindkey -- "$key[Backspace]" backward-delete-char
[[ -n "$key[Delete]"    ]] && bindkey -- "$key[Delete]"    delete-char

# lol zsh is so broken
bindkey -- "[1;5D"	backward-word
bindkey -- "[1;5C"	forward-word


# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
	function zle-line-init () {
		echoti smkx
	}
	function zle-line-finish () {
		echoti rmkx
	}
	zle -N zle-line-init
	zle -N zle-line-finish
fi

setopt PROMPT_SUBST # required for __git_ps1
PROMPT='%B%F{yellow}[%F{green}%n%F{yellow}@%F{blue}%m%F{yellow}][%F{magenta}%1~%F{yellow}$(__git_ps1 " (%s)")]%f%b %# '
RPROMPT='[%?] %w %t'

source /usr/share/git/completion/git-prompt.sh
source ~/.environment
source ~/.aliases
source ~/.aliases.zsh

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
