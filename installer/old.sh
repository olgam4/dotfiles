#!/bin/zsh

# --- Configuration Variables ---
readonly DOTFILES_REPO="https://github.com/olgam4/dotfiles.git"
EMAIL="olivier@glo.quebec"
NAME="Olivier Gamache"
CONFIG_DIR="$HOME/.config"
DOTFILES_DIR="$HOME/dotfiles"


# --- 4. Create Symbolic Links ---
# Creates symlinks from the cloned repo to the appropriate system locations.
create_symlinks() {
  echo "--- Creating symbolic links..."

  careful_symlink "$DOTFILES_DIR/git" "$CONFIG_DIR/git"
  careful_symlink "$DOTFILES_DIR/nvim" "$CONFIG_DIR/nvim"

  careful_symlink "$DOTFILES_DIR/kitty" "$CONFIG_DIR/kitty"

  careful_symlink "$DOTFILES_DIR/starship.toml" "$CONFIG_DIR/starship.toml"

  careful_symlink "$DOTFILES_DIR/zsh" "$CONFIG_DIR/zsh"
  careful_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
}

careful_symlink() {
  local source="$1"
  local destination="$2"

  # Check if the destination exists and is a file or directory
  if [ -e "$destination" ]; then
    # -e checks if a file or directory exists.
    # It’s a safer and more general check.
    echo "  - Removing existing entry at $destination..."
    rm -rf "$destination"
    # The -r flag allows rm to handle directories.
    # The -f flag forces the removal without prompting for confirmation.
  fi

  # Create the symbolic link
  echo "  - Creating symlink from $source to $destination"
  ln -s "$source" "$destination"
}

update_git_config() {
  echo "--- Updating git config..."

  git config --global user.name "$NAME"
  git config --global user.email "$EMAIL"
}

install_prerequisites
install_brew_packages
clone_or_update_repo
update_git_config
create_symlinks
rustup-init -y
