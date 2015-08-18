# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/oscar/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#very similar to my bashrc, but w/o incompatibalities
export EDITOR="vim"
# Recommended by rbenv
PATH="$HOME/.rbenv/bin:$PATH"
# shouldn't need to zsh argument, but w/e
eval "$(rbenv init - zsh)"

#for postgresql
PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"
PATH="$PATH:$HOME/.bin"

if [ -f ~/.nvm/nvm.sh ]; then
  source ~/.nvm/nvm.sh
  nvm alias default 0.10 > /dev/null
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Load aliases
[[ -f ~/.aliases ]] && source ~/.aliases
