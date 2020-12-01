# ------------
# Environments
# ------------

ENVPATH=~/.dotfiles/env
CURRENTENV=""

env_vars=()
env_aliases=()

if [ ! -d "$ENVPATH" ]; then
	mkdir $ENVPATH
fi

set_env_var() {
	env_vars+=$1
	export $1=$2
}

set_env_alias() {
	env_aliases+=$1
	alias $1=$2
}

alias env_alias="set_env_alias"
alias env_export="set_env_var"

set_environment() {
	if [[ ${#env_vars[@]} -ne 0 ]]; then
		unset $env_vars[@]
		env_vars=()
	fi
	if [[ ${#env_aliases[@]} -ne 0 ]]; then
		unalias $env_aliases[@]
		env_aliases=()
	fi
	if [[ "$1" == "none" ]]; then
		CURRENTENV=""
		echo 'Cleared environment variables'
	else
		if test -f $ENVPATH/$1.env; then
			CURRENTENV=$1
			source $ENVPATH/$1.env
			echo "Set $1 environment"
		else
			echo "Cannot find $ENVPATH/$1.env"
		fi
	fi
}

alias set_env="set_environment"

# p10k segment to be used if desired
prompt_currentenv() {
	if [ ! $CURRENTENV ]; then
		# p10k segment -f purple -t $CURRENTENV
		# p10k segment -t "$CURRENTENV"
		p10k segment -s $state -i '⭐' -f blue -t ${size[1]}b
	fi
}
