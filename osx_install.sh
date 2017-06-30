#!/usr/bin/env bash

###############################################################################
# XCode Command Line Tools                                                    #
###############################################################################
# From: https://github.com/nicksp/dotfiles and https://github.com/alrra/dotfiles

if ! xcode-select --print-path &> /dev/null; then

  # Prompt user to install the XCode Command Line Tools
  xcode-select --install &> /dev/null

  # Wait until the XCode Command Line Tools are installed
  until xcode-select --print-path &> /dev/null; do
    sleep 5
  done

  # Point the `xcode-select` developer directory to
  # the appropriate directory from within `Xcode.app`
  # https://github.com/alrra/dotfiles/issues/13
  sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer

  # Automatically accept xcode license.
  sudo xcodebuild -license accept &> /dev/null
  echo 'Agreed with the XCode Command Line Tools licence'

fi

#install homebrew & command line tools
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew bundle

#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#install dotfiles
bash ~/.dotfiles/dotfiles_install.sh

#setup plugins for vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

#install plugins for tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/bin/install_plugins

# Install the `pure` zsh theme
git clone https://github.com/sindresorhus/pure.git /tmp/pure
cp /tmp/pure/pure.zsh ~/.oh-my-zsh/custom/pure.zsh-theme
cp /tmp/pure/async.zsh ~/.oh-my-zsh/custom/async.zsh

# Ruby stuff
rbenv install 2.4.1 --verbose
rbenv global 2.4.1
gem update --system
gem install bundler rubocop
