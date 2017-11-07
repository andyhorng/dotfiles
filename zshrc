# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
export SHELL=zsh
# export RBENV_ROOT=/usr/local/var/rbenv
export JAVA_HOME="$(/usr/libexec/java_home)"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steeef"
# ZSH_THEME="smt"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-syntax-highlighting history-substring-search osx sublime) 

source $ZSH/oh-my-zsh.sh

HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
bindkey -v
bindkey -M 'vicmd' v edit-command-line
bindkey '^P' push-line
bindkey '^R' history-incremental-search-backward
bindkey '^E' insert-last-word

setopt autopushd
setopt NO_NOMATCH

# The following lines were added by compinstall
zstyle :compinstall filename '/home/andy/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Alias
# alias ls='ls --color=auto'
alias ll='ls -l'
# alias grep='grep --colour=auto'
alias dirs='dirs -v'
alias ..='cd ..'
alias mypy='. /Users/andy/workspace/virtualenv/bin/activate'

alias php_ctags='ctags -R --fields=+l --links=no -V --exclude=tags'
alias vim='nvim'

# copy & paste
if [[ `uname` == 'Darwin' ]]
then 
  alias copy=pbcopy
  alias paste=pbpaste
  # urldecode
  alias urldecode='pbpaste | python3 -c "import sys; from urllib import parse ; print(parse.unquote(sys.stdin.readline()))" | pbcopy'
fi

# git
alias gist='git status'
alias gich='git checkout'
alias gidi='git diff'
alias gipuupma='git pull upstream master'

# End of alias
#
export LSCOLORS="exfxcxdxbxegedabagacad"

# set PATH
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/sbin:/usr/local/bin:$PATH:/opt/jruby/bin:/opt/bin
export EDITOR="nvim"
export PATH=$PATH:~/.rbenv/bin
export PATH=$PATH:/usr/local/smlnj/bin
export PATH=$PATH:~/Library/Haskell/bin
export PATH=$PATH:~/.cabal/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:~/bin

# java
export PATH=$PATH:$JAVA_HOME/bin
# android home
export AND_HOME=$HOME/android-sdk-linux
export PATH=$PATH:$AND_HOME/tools
export PATH=$PATH:$AND_HOME/platform-tools
export PATH=$PATH:$AND_HOME/platforms
# maven
export PATH=$PATH:$HOME/bin/apache-maven-3.0.3/bin
#cts tools
export PATH=$PATH:/home/andy/cts/tools
# ant 
export ANT_HOME=/home/andy/apache-ant-1.8.2
export PATH=$PATH:$ANT_HOME/bin

# npm of node.js
export PATH=$PATH:/usr/local/share/npm/bin
# python user side
export PATH=$PATH:$HOME/Library/Python/2.7/bin

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# go
export GOPATH=$HOME/src/go
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# export PATH="$(brew --prefix josegonzalez/php/php54)/bin:$PATH"

# private bin
if [[ -s /home/andy/.rvm/scripts/rvm ]] ; then source /home/andy/.rvm/scripts/rvm ; fi

export LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# phpbrew
# export PHPBREW_SET_PROMPT=1
# source /Users/andy/.phpbrew/bashrc

source "$ZSH/plugins/history-substring-search/history-substring-search.zsh"

# added by travis gem
[ -f /Users/andy/.travis/travis.sh ] && source /Users/andy/.travis/travis.sh

# Base16 Shell
BASE16_SCHEME="default"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

function agvim () {
  vim $(ag $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="/Users/andyhung/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# The next line updates PATH for the Google Cloud SDK.
# source '/Users/andyhung/Downloads/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
# source '/Users/andyhung/Downloads/google-cloud-sdk/completion.zsh.inc'

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh


source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"

source ~/.cargo/env
