#!/usr/bin/bash

export HISTSIZE=10000
export HISTTIMEFORMAT="%y-%m-%d %T "

case $- in
	*i*)
		# interactive, continue fancy stuff. Printing anything when a
		# non-interactive session is active breaks scp and other utils
		source ~/.aliases
		source ~/.environment

		echo Running $(uname) $(uname -r) on $(uname -n) \($(uname -m)\)
		;;
	*)
		# non-interactive, don't do anything fancy
		;;
esac

