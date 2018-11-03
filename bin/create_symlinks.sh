#!/usr/bin/env bash

# TODO: automatically detect dotfiles instead of hard-coding the filenames
DOTFILES=(
  "ctags"
  "eslintrc.js"
  "gitconfig"
  "gitignore"
  "tmux.conf"
  "vimrc"
  "zshrc"
)

# Config files that follow xdg directory spec
XDG_CONFIGS="$HOME/.dotfiles/config/*"

for dotfile in "${DOTFILES[@]}"
do
  ln -sf "$HOME/.dotfiles/$dotfile" "$HOME/.$dotfile"
done


for directory in $XDG_CONFIGS
do
  filename="$(basename $directory)"
  ln -sf "$directory" "$HOME/.config/$filename"
done
