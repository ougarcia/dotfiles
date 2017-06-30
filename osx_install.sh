#!/bin/bash

#use the following line to install xcode
#xcode-select --install

#install homebrew & command line tools
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install git
brew install heroku-toolbelt
brew install postgres
brew install rbenv
brew install rbenv-gem-rehash
brew install ruby-build
brew install vim
brew install tmux
brew install zsh
brew install the_silver_searcher
brew install tree
brew install reattach-to-user-namespace
brew install httpie
brew install fpp

#install brew-cask & gui tools
brew tap caskroom/cask

brew cask install google-chrome
brew cask install atom
brew cask install postgres
brew cask install flux
brew cask install vlc
brew cask install iterm2
brew cask install evernote
brew cask install slack
brew cask install karabiner-elements
brew cask install postman
brew cask install hipchat


#get ruby up and running
#might eventually want to add the —verbose flag, usually takes a while.
rbenv install 2.2.4
rbenv global 2.2.4


#install node and jshint. Eventually I’ll want to use nvm
brew install node
npm install -g jshint

#install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh



#install dotfiles
bash ~/.dotfiles/dotfiles_install.sh

#setup plugins for vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

#install plugins for tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/bin/install_plugins

#install important gems
gem update --system
gem install bundler rails rubocop

# Install fonts
brew tap caskroom/fonts
brew cask install font-source-code-pro

# Install the `pure` zsh theme
rm ~/.oh-my-zsh/themes/pure.zsh-theme
git clone https://github.com/sindresorhus/pure.git
cp pure/pure.zsh ~/.oh-my-zsh/custom/pure.zsh-theme
cp pure/async.zsh ~/.oh-my-zsh/custom/async.zsh

rm -rf pure/

