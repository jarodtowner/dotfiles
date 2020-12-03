# This plugin will use zsh lifecycle hooks to
# clear the terminal if you enter a blank command

# Run clear after a command has been run but before it has been executed.

preexec() {
	cmd=$1
}

precmd() {
	if [ ! "$cmd"	]; then
		eval $EMPTY_COMMAND
	fi
	cmd=''
  return 0;
}

