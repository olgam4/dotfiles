#!/bin/sh

# DETECT OS
# Shamelessly copied from stackoverflow:
# https://stackoverflow.com/questions/394230/how-to-detect-the-os-from-a-bash-script
# =================================================================================
DOTFILES_REPO="https://github.com/olgam4/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"

OS="$(uname -s | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz')"
KERNEL="$(uname -r)"
MACH="$(uname -m)"

if [ "$OS" = "darwin" ]; then
  OS='mac'
elif [ -f /etc/fedora-release ]; then
  OS='fedora'
fi

echo
echo "==========================================="
echo "$OS"
echo "$KERNEL"
echo "$MACH"
echo "==========================================="
echo

echo '--- Cloning or updating dotfiles repository...'
if [ -d "$DOTFILES_DIR/.git" ]; then
  echo "  - Dotfiles directory found. Pulling latest changes..."
  git -C "$DOTFILES_DIR" pull --rebase || true
else
  echo "  - Dotfiles directory not found. Cloning..."
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi
cd "$DOTFILES_DIR"

. ./bin/utils.sh

echo 'Installing shared steps...'
if [ "$OS" = 'mac' ]; then
  echo 'macOS detected'
  zsh ./installer/mac-setup.sh
elif [ "$OS" = 'fedora' ]; then
  echo 'Fedora detected'
  sh ./installer/fedora-setup.sh
else
  echo "Unsupported OS: $OS" >&2
  exit 1
fi
