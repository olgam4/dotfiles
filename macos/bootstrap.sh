#!/bin/bash

declare -r GITHUB_REPOSITORY="olgam4/dotfiles"
export DOTFILES=~/.dotfiles

echo 'Dotfiles - Olivier Gamache'

if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP

Usage: $(basename "$0")

  get some help
    -h --help     see this help-page

  run locally
    -l --local    use this file instead of github's

See the README for documentation.
https://github.com/$GITHUB_REPOSITORY

Copyright © 2021 Olivier Gamache
HELP
exit; fi


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
        printf "${label}${!frameRef}"
        printf "\033[K"
        printf "\033[G"
        sleep 0.05
      done
    done
  }

  spinnerRun &
  local spinnerPid=$!
  ${action} 1>/dev/null 2>/dev/null
  kill "${spinnerPid}"
  wait "${spinnerPid}" 2>/dev/null
  printf "\033[K"
  printf "\033[G"
  echo "${label}✓"
}

function symlink() {
  local config="${1}"
  ln -sf $DOTFILES/$config ~/.config/
}


###############################

# Initialize
if [[ ! -d $DOTFILES ]]; then
  if [[ "$1" == "-l" || "$1" == "--local" ]]; then
    e_arrow "Running locally"
    mkdir $DOTFILES
    cp -a . $DOTFILES
    echo "$DOTFILES"
  else
    spinner "git clone git@github.com:$GITHUB_REPOSITORY.git $DOTFILES" "🚀 Loading dotfiles..."
  fi
  cd $DOTFILES
else
  e_header "Updating..."
  cd $DOTFILES
  spinner "git pull" "🚀 Reloading dotfiles..."
fi

echo "Giving power to dotfiles..."
chmod -R +x $DOTFILES/bin $DOTFILES/macos

# Install brew
./macos/install/brew.sh

e_header "Setuping nvim..."
symlink nvim
e_success "Nvim: done!"

e_header "Setting up git..."
symlink git
if [[ ! $(git config --global user.name) ]]; then
  if [[ $GIT_AUTH_NAME ]]; then
    declare -r name=$GIT_AUTH_NAME
  else
    echo -n "What is your name? "
    read name
  fi
  git config --global user.name "$name"
fi

if [[ ! $(git config --global user.email) ]]; then
  if [[ $GIT_AUTH_EMAIL ]]; then
    declare -r email=$GIT_AUTH_EMAIL
  else
    echo -n "What is your email? "
    read email
  fi
  git config --global user.email "$email"
fi

e_success "Git: done!"

e_header "Setuping karabiner..."
symlink karabiner
e_success "Karabiner: done!"

e_header "Setuping iterm2..."
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string $DOTFILES/iterm2
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
symlink iterm2
e_success "iterm2: done!"

e_header "All done!"
