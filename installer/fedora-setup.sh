#!/bin/sh

set -e

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

PACKAGES="zsh git curl fzf zoxide fd-find eza bat kitty cowsay lolcat ghostscript"

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

echo "--- Installing Fedora packages..."
sudo dnf install -y $PACKAGES

if ! command_exists starship; then
  echo "--- Installing starship..."
  curl -sS https://starship.rs/install.sh | sh -s -- -y -b "$HOME/.local/bin"
fi

if [ ! -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ]; then
  echo "--- Installing Zap..."
  zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/release-v1/install.zsh) --keep
fi

ZSH_PATH="$(command -v zsh)"
if [ -n "$ZSH_PATH" ] && [ "$(getent passwd "$USER" | cut -d: -f7)" != "$ZSH_PATH" ]; then
  echo "--- Setting zsh as the default shell..."
  chsh -s "$ZSH_PATH"
fi

mkdir -p "$HOME/.local/bin"
if command_exists fdfind && ! command_exists fd; then
  echo "--- Linking fd..."
  ln -sf "$(command -v fdfind)" "$HOME/.local/bin/fd"
fi

echo "--- Creating symbolic links..."
careful_symlink "$DOTFILES_DIR/git" "$CONFIG_DIR/git"
careful_symlink "$DOTFILES_DIR/nvim" "$CONFIG_DIR/nvim"
careful_symlink "$DOTFILES_DIR/kitty" "$CONFIG_DIR/kitty"
careful_symlink "$DOTFILES_DIR/starship.toml" "$CONFIG_DIR/starship.toml"
careful_symlink "$DOTFILES_DIR/zsh" "$CONFIG_DIR/zsh"
careful_symlink "$DOTFILES_DIR/bin" "$CONFIG_DIR/bin"
careful_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
