# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/adam/.zshrc'
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="my"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all
# Customize to your needs...
HOME_BIN_PATH=~/bin
export EDITOR="vim"

# Android SDK path
ANDROID_TOOLS_PATH=~/dev/adt/sdk/tools
ANDROID_PLATFORM_TOOLS_PATH=~/dev/adt/sdk/platform-tools
export SDK_ROOT=/Users/lerner/dev/adt/sdk/
export NDK_ROOT=/Users/lerner/dev/ndk/
export ANDROID_NDK=/Users/lerner/dev/ndk/

LATEX_PATH="/usr/local/texlive/2013/bin"

# Chromium git tools
GIT_CL_ETC_PATH=~/depot_tools

# Gradle
export GRADLE_HOME="/Users/lerner/Downloads/gradle-1.11"

export PATH="/usr/local/bin:$LATEX_PATH:$GIT_CL_ETC_PATH:$ANDROID_SDK_PATH:$ANDROID_TOOLS_PATH:$ANDROID_PLATFORM_TOOLS_PATH:$HOME_BIN_PATH:$GRADLE_HOME/bin:$PATH"

# . /etc/zsh_command_not_found

# Aliases
alias mmi="make && sudo make install"
alias pssh8="pssh -e /tmp/stderr -l lerner -h ~/tioip/emu.hosts -o /tmp/stdout"
alias pssh="parallel-ssh"
alias db="dropbox.py"
alias fndate='date +"%Y_%m_%d"'
alias mysqldoosra="mysql --host=doosra.cs.washington.edu --user=lerner --password=lerner_rocks\! censorship_measurement"
alias tool='python -mjson.tool'
alias home='cd "$(git rev-parse --show-toplevel)"'

# Useless comment
#

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

bindkey '^f' forward-word
bindkey '^b' backward-word


# show git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (command git symbolic-ref -q HEAD || command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
}

# show red star if there are uncommitted changes
parse_git_dirty() {
  if command git diff-index --quiet HEAD 2> /dev/null; then
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  else
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  fi
}

function git_custom_status() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX${git_where#(refs/heads/|tags/)}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

export GOPATH=$HOME/Dropbox/code/go

# added by Anaconda 1.8.0 installer
export PATH="/Users/lerner/anaconda/bin:$PATH"
export PATH=$PATH:$GOPATH/bin

export NVM_DIR="/Users/lerner/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
