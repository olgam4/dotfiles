#!/bin/zsh

# --- Configuration Variables ---
readonly DOTFILES_REPO="https://github.com/olgam4/dotfiles.git"
readonly DOTFILES_DIR="$HOME/.dotfiles"

# --- Helper Functions ---
# Checks if a command exists in the current environment
command_exists () {
  command -v "$1" >/dev/null 2>&1
}

# --- 1. Install Prerequisites ---
# Installs Xcode Command Line Tools and Homebrew if they are missing.
install_prerequisites() {
  echo "--- Checking for prerequisites..."

  if ! xcode-select --print-path &> /dev/null; then
      echo "  - Xcode Command Line Tools not found. Installing..."
      xcode-select --install
      # Wait for the user to complete the installation
      read -p "Press any key once the Xcode Command Line Tools installation is complete..."
  else
      echo "  - Xcode Command Line Tools already installed. Skipping."
  fi

  if ! command_exists brew; then
      echo "  - Homebrew not found. Installing..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      # Make sure Homebrew is in the PATH for the current session
      export PATH="/opt/homebrew/bin:$PATH"
  else
      echo "  - Homebrew already installed. Skipping."
  fi
}

# --- 2. Clone or Update Dotfiles Repository ---
# Clones the repository if it doesn't exist, or pulls the latest changes if it does.
clone_or_update_repo() {
  echo "--- Cloning or updating dotfiles repository..."

  if [ -d "$DOTFILES_DIR" ]; then
      echo "  - Dotfiles directory found. Pulling latest changes..."
      git -C "$DOTFILES_DIR" pull
  else
      echo "  - Dotfiles directory not found. Cloning..."
      git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
  fi
}

# --- 3. Install Homebrew Packages ---
# Installs a list of specified packages using Homebrew.
install_brew_packages() {
  echo "--- Installing Homebrew packages..."
  local -a packages=(
    git
    neovim
    bat
    kitty
    cowsay
    starship
    exa
    fzf
    mask
    ripgrep
    zoxide
  )
  brew install "${packages[@]}"
}

# --- 4. Create Symbolic Links ---
# Creates symlinks from the cloned repo to the appropriate system locations.
create_symlinks() {
  echo "--- Creating symbolic links..."

  careful_symlink "$DOFILES_DIR/git" "$HOME/.config/git"
  careful_symlink "$DOFILES_DIR/nvim" "$HOME/.config/nvim"

  careful_symlink "$DOFILES_DIR/kitty" "$HOME/.config/kitty"

  careful_symlink "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"

  careful_symlink "$DOTFILES_DIR/zsh" "$HOME/.config/zsh"
  careful_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
}

# function to create a symlink to a file in the dotfiles directory

careful_symlink() {
  local source="$1"
  local destination="$2"

  if [ -f "$source" ]; then
    echo "  - Removing existing $destination..."
    rm "$destination"
  fi

  ln -s "$source" "$destination"
}

# --- 5. Main Execution Flow ---
echo "🚀 Starting dotfiles installation..."
install_prerequisites
clone_or_update_repo
install_brew_packages
create_symlinks

echo "✅ Dotfiles installation complete!"
echo "✨ Please restart your terminal for all changes to take effect."
