#!/bin/bash
#use the following line to install xcode
#xcode-select --install
#it takes a while, run the command and wait for it to download, then run the script

#install homebrew and homebrew cask
#ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#brew install caskroom/cask/brew-cask

#install cli tools
brew install git
brew install heroku-toolbelt
brew install postgres
brew install rbenv
brew install rbenv-gem-rehash
brew install ruby-build
brew install vim

#install gui tools
brew cask install google-chrome
brew cask install google-drive
brew cask install atom
brew cask install postgres
brew cask install flux
brew cask install vlc
brew cask install iterm2
brew cask install evernote
brew cask install todoist
brew cask install slack
brew cask install karabiner
brew cask install deluge
brew cask install radiant-player
#lags a lot when downloading 
#brew cask install dash


#get ruby up and running
#might eventually want to add the —verbose flag, usually takes a while.
rbenv install 2.2.2
rbenv global 2.2.2


#install node and jshint
#eventually I’ll want to use nvm
brew install node
npm install -g jshint

#install dotfiles
bash ~/.dotfiles/dotfiles_install.sh

#setup  Vundler for vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

#install important gems
gem update --system
gem install bundler rails
