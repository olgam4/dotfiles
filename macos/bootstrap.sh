#!/bin/bash

declare -r GITHUB_REPOSITORY="olgam4/dotfiles"

echo 'Dotfiles - Olivier Gamache'

if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP

Usage: $(basename "$0")


See the README for documentation.
https://github.com/$GITHUB_REPOSITORY

Copyright © 2021 Olivier Gamache
HELP
exit; fi

export DOTFILES=~/.dotfiles

# Logging stuff.
function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()    { echo -e " \033[1;34m➜\033[0m  $@"; }



# Initialize
if [[ ! -d $DOTFILES ]]; then
  e_header "Downloading dotfiles..."
  git clone git@github.com:$GITHUB_REPOSITORY.git $DOTFILES
  cd $DOTFILES
fi

e_header "Setuping nvim..."
ln -s $(pwd)/nvim ~/.config/
e_success "Nvim: done!"

e_header "Setting up git..."
ln -s $(pwd)/gitconfig ~/.gitconfig
echo -n "What is your name?"
read name
git config --global user.name "$name"

echo -n "What is your email?"
read email
git config --global user.email "$email"
e_success "Git: gone!"

e_header "All done!"
