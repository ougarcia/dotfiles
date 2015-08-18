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
