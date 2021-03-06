# *zshrc*
# ============ Table of Contents ===================
#
#|exports| Exported Variables
#|modules| Modules
#|options| Set Options |line_editor| Settings for the line editor
#|functions| Custom functions
#|aliases| Command aliases
#|external| Externally loaded files
#
# ==================================================

#{{{ *exports*
# XDG Standards
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export COWPATH=/usr/local/share/cows:$XDG_DATA_HOME/cows
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_241.jdk/Contents/Home
export ANDROID_SDK_ROOT=~/Library/Android/sdk
export TASKRC=$XDG_CONFIG_HOME/taskwarrior/taskrc
export TIMERC=$XDG_CONFIG_HOME/timewarrior/timerc
export FZF_DEFAULT_COMMAND='fd -H --type f'
export EMPTY_COMMAND='' # If an empty command is entered, this command will be run instead
export PATH=/usr/local/opt/ruby/bin:/usr/local/bin:/sbin:/usr/local/sbin:/usr/local/opt/inetutils/libexec/gnubin:/opt/apache-maven-3.6.3/bin:/usr/bin:/bin:/usr/sbin:/usr/local/lib/node_modules:~/bin:~/Library/Android/sdk/platform-tools
export EDITOR="nvim"
export TASKDDATA=/Users/jarod/.local/share/taskd
#}}}

#{{{ *modules*
zmodload zsh/zpty
zmodload zsh/complete
zmodload zsh/complist
zmodload zsh/computil
#}}}

#{{{ *options*
autoload -Uz compinit && compinit
setopt autocd
setopt AUTO_PUSHD
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:git:*' user-commands fco:'description for foo'
#}}}

#{{{ *line_editor*

# Enables p10k instant prompt 
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
bindkey -v
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char
PROMPT_EOL_MARK=''
PROMPT_POSITION='bottom' # This is managed by the pin prompt plugin

# Make up & down keys search based on what's already entered
case $(uname -s) in
'MacOS')
  bindkey '\e[A' history-beginning-search-backward
  bindkey '\e[B' history-beginning-search-forward
;;
'Linux')
  bindkey "^[OA" history-beginning-search-backward
  bindkey "^[OB" history-beginning-search-forward
;;
esac
#}}}

#{{{ *functions*

function dev-tmux() {
  tmux new-session -s $1 \; rename-window 'server' \; new-window \; rename-window 'editor' \; new-window \; rename-window 'tunnel' \; attach
}

alias findfunction=$(which fd > /dev/null && echo "fd" || which fdfind > /dev/null && echo "fdfind")
# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  findfunction --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  findfunction --type d --hidden --follow --exclude ".git" . "$1"
}
#}}}

#{{{ *aliases* 
alias py="python3"
function weather() {
  curl v2.wttr.in/$1
}
alias vim="nvim"
alias vimm="nvim -M"
alias ovim="/usr/bin/vim"
alias src="source ~/.zshrc"
alias reload="exec zsh -l"
alias run="scripts"

alias ls="ls -G"
alias la="ls -A"
alias ll="ls -Al"
alias lll="ls -l | tail -n \$(( \$(ls -l | wc -l) - 1 )) | awk '{print \$NF}'"
alias -g ...="../.."
alias -g ....="../../.."

alias sfy="spotify"
alias next="spotify next"
alias prev="spotify prev"
alias pause="spotify pause"
alias play="spotify play"

alias split="split_tab"
alias vsplit="vsplit_tab"

alias opg="op get"
alias opgi="op get item"

# Set copy command based on what's installed
which pbcopy > /dev/null && alias yank="pbcopy"
which xclip > /dev/null && alias yank="xclip -i -sel clip"

# Set paste command based on what's installed
which pbpaste > /dev/null && alias put="pbpaste"
which xclip > /dev/null && alias put="xclip -o -sel clip"

alias -s txt=vim
alias -s yaml=vim
alias -s yml=vim
alias -s md=vim
alias -s js=node
alias -s ts=ts-node
alias -s py=python3

alias -g L="| less"
alias -g Cerr="2>&1 > /dev/null | yank"
alias -g H="| head -n"
alias -g T="| tail -n"
alias -g F="| ag"
alias -g Ln="| getLine"
alias -g Last="| awk '{print \$NF}'"

# }}}

# {{{ *external*

# Autoload directory
for file in ~/.config/zsh/autoload/*; do
	if [ $(echo "$file" | grep -vE ".disable$") ]; then
		source "$file"
	fi
done

# Source local changes to zshrc
if [ -f $XDG_CONFIG_HOME/local_override/zsh/.zshrc ]; then
  source $XDG_CONFIG_HOME/local_override/zsh/.zshrc
fi

[ -f $XDG_CONFIG_HOME/fzf/.fzf.zsh ] && source $XDG_CONFIG_HOME/fzf/.fzf.zsh
 # }}}


# If the shell is just starting up, clear to position the prompt
if [ ! $FIRST_RUN ]
then
  clear
fi

function chpwd() {
  type onLeaveDir > /dev/null && onLeaveDir
  type onLeaveDir > /dev/null && unset -f onLeaveDir
  type onEnterDir > /dev/null && unset -f onEnterDir
  [ -f ./.zshrc ] && source ./.zshrc
  type onEnterDir > /dev/null && onEnterDir
}

export FIRST_RUN=true
