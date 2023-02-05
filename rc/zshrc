export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Path to oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME=""

plugins=(brew docker git)

## Set environment Variables
export EDITOR="nvim"

## Update PATH

# enable shims for pyenv if installed
if which pyenv > /dev/null;
  then eval "$(pyenv init -)"
fi

# Poetry if installed
if [ -f $HOME/.poetry/env ]; then
    source $HOME/.poetry/env
fi

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
prompt pure

## Aliases
alias v='nvim'
alias t='tmux'
alias ta='tmux a -t'
alias gll='git log --oneline'

# Checkout git branch with fzf
fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

eval "$(direnv hook zsh)"

## Not version-controlled configs and aliases
if [ -f ~/.private-zshrc ]; then
    source ~/.private-zshrc
fi

# TODO: Write an alias for git diff without comments.
# TODO: Use https://github.com/sharkdp/fd
# TODO: Modern alternatives to classic unix tools: xsv, exa, una, tokei
# TODO: Use tmuxp
