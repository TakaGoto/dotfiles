# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gozilla"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# OPAM configuration
. /Users/taka/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
