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

###############################
#                             #
#     Utilitary functions     #
#                             #
###############################

# Logging stuff.
function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()    { echo -e " \033[1;34m➜\033[0m  $@"; }

DEFAULT_SpinnerFrames=('_' '_' '_' '-' '`' '`' "'" '´' '-' '_' '_' '_')
function spinner() {
  local frameRef
  local action="${1}"
  local label="${2} "
  local spinnerRef="${3-DEFAULT_SpinnerFrames}"
  local spinnerFrames=$(eval "echo \${!${spinnerRef}[@]}")

  spinnerRun() {
    while true; do
      for frame in ${spinnerFrames[@]}; do
        frameRef="${spinnerRef}[${frame}]"
        echo "${label}${!frameRef}"
        tput cuu1 tput el
        sleep 0.05
      done
    done
    echo -e "\r"
  }

  spinnerRun &
  local spinnerPid=$!
  ${action} 1>/dev/null 2>/dev/null
  kill "${spinnerPid}"
  wait "${spinnerPid}" 2>/dev/null
}

function symlink() {
  local config="${1}"
  ln -s $(pwd)/$config ~/.config/
}


###############################

# Initialize
if [[ ! -d $DOTFILES ]]; then
  spinner "git clone git@github.com:$GITHUB_REPOSITORY.git $DOTFILES" "Loading dotfiles..."
  cd $DOTFILES
fi

e_header "Setuping nvim..."
symlink nvim
e_success "Nvim: done!"

e_header "Setting up git..."
symlink git
echo -n "What is your name? "
read name
#git config --global user.name "$name"

echo -n "What is your email? "
read email
#git config --global user.email "$email"
e_success "Git: done!"

e_header "Setuping karabiner..."
symlink karabiner
e_success "Karabiner: done!"

e_header "Setuping iterm2..."
symlink iterm2
e_success "iterm2: done!"

e_header "All done!"
