# Path to your oh-my-zsh installation.
export ZSH=/Users/oscar/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="pure"

plugins=(git bundler brew rails rvm)

export EDITOR="vim"

## Updating Path

# Recommended by rbenv
PATH="$HOME/.rbenv/bin:$PATH"

# shouldn't need to zsh argument, but w/e
eval "$(rbenv init - zsh)"

# for postgresql
PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"
PATH="$PATH:$HOME/.bin"

# node version manager
if [ -f ~/.nvm/nvm.sh ]; then
  source ~/.nvm/nvm.sh
  nvm alias default 0.10 > /dev/null
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

## End updating path

source $ZSH/oh-my-zsh.sh

alias v="vim"
alias t="tmux"
alias ta="tmux a -t"
