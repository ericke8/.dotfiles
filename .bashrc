# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# disable bell
bind 'set bell-style none'

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

# ignore ls, bg, fg, and history commands from history
HISTIGNORE='ls:bg:fg:history'

# put date with history in format given (YYYY-MM-D HH:MM:SS)
HISTTIMEFORMAT='%F %T '

# after each command, append to the history file
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a"

# force commands that entered on more than one line to be adjusted to fit on only one 
shopt -s cmdhist

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=50000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#     ;;
# *)
#     ;;
# esac

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# platform specific config
case "$(uname -s)" in
  # Unix
  Linux*|Darwin*)
    # mise
    if command -v mise &>/dev/null; then
      # default mise activation, includes WSL
      eval "$(mise activate bash)"
    fi
    
    ;;

  # Windows
  MINGW*|MSYS*|CYGWIN*)
    # starship install path
    PATH="/c/Program Files/starship/bin:$PATH"

    # mise
    if command -v mise &>/dev/null; then
      _mise_script="$(mise activate bash)"

      # patch activation to inject cygpath to convert from Windows to unix paths for MSYS2/MinGW
      _fixed_mise_script=$(
      printf '%s\n' "$_mise_script" |
      sed -e 's|eval "\$(mise hook-env .*)"|&; export PATH="$(/usr/bin/cygpath -u -p \"$PATH\")";|' \
          -e 's|eval "\$(command "\$__MISE_EXE" "\$command" "\$@")"|&; export PATH="$(/usr/bin/cygpath -u -p \"$PATH\")";|'
      )
      eval "$_fixed_mise_script"
    fi
    ;;
esac

eval "$(starship init bash)"
