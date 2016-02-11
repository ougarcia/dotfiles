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

alias console-prod='heroku run rails console --remote production'
alias console-stag='heroku run rails console --remote staging'
alias cu='rake cucumber'
alias deploy-migrate-prod='git push production master:master; heroku run rake db:migrate --remote production'
alias deploy-migrate-stag='git push staging master:master; heroku run rake db:migrate --remote staging'

alias deploy-prod='git push production master:master'
alias deploy-stag='git push staging master:master'

alias log-prod='heroku logs --tail --remote production'
alias log-stag='heroku logs --tail --remote staging'
alias migrate='rake db:migrate'

alias migrate-prod='heroku run rake db:migrate --remote production'
alias migrate-stag='heroku run rake db:migrate --remote staging'
alias migrate-status='rake db:migrate:status'
alias releases-prod='heroku releases --remote production'
alias releases-stag='heroku releases --remote staging'


copy-db-prod() {
  heroku pg:backups capture --remote production;
  curl -o /tmp/latest.dump `heroku pg:backups public-url --remote production`
  pg_restore --verbose --clean --no-acl --no-owner -h localhost -U oscar -d f50_development /tmp/latest.dump
}
