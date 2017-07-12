# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="pure"

plugins=(git bundler brew rvm)

export EDITOR="vim"

## Updating Path

# TODO: Figure out why this requires the zsh argument
eval "$(rbenv init - zsh)"

# enable shims for pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# for postgresql
# TODO: Install postgres w/o Postgers.app
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

alias v='vim'
alias t='tmux'
alias ta='tmux a -t'
alias https='http --default-scheme=https'

alias vssh='TERM=xterm vagrant ssh'

alias gll='git log --oneline'

