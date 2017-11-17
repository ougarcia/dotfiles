# Path to oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="pure"

plugins=(brew bundler docker git rvm)

## Set enviornment Variables
export EDITOR="vim"
export HOMEBREW_NO_GITHUB_API=1

## Update PATH

# TODO: Figure out why this requires the zsh argument
if which rvenv > /dev/null; then
  eval "$(rbenv init - zsh)"
fi

# enable shims for pyenv if installed
if which pyenv > /dev/null;
  then eval "$(pyenv init -)"
fi

# for postgresql
# TODO: Install postgres w/o Postgres.app
PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"
PATH="$PATH:$HOME/.bin"

# node version manager
if [ -f ~/.nvm/nvm.sh ]; then
  source ~/.nvm/nvm.sh
  nvm alias default 0.10 > /dev/null
fi

source $ZSH/oh-my-zsh.sh

## Aliases
alias v='vim'
alias t='tmux'
alias ta='tmux a -t'
alias https='http --default-scheme=https'

alias vssh='TERM=xterm vagrant ssh'

alias gll='git log --oneline'

# TODO: Write an alias for git diff without comments.
# TODO: Use https://github.com/sharkdp/fd
# TODO: Modern alternatives to classic unix tools: xsv, exa, una, tokei
