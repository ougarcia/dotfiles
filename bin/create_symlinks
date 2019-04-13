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

DOTFILES_DIRECTORY=$(realpath "$PWD/..")

for dotfile in "${DOTFILES[@]}"
do
  ln -sf "$DOTFILES_DIRECTORY/$dotfile" "$HOME/.$dotfile"
done

# Config files that follow xdg directory spec
XDG_CONFIGS="$DOTFILES_DIRECTORY/config/*"

for directory in $XDG_CONFIGS
do
  filename="$(basename "$directory")"
  ln -sf "$directory" "$HOME/.config/$filename"
done
