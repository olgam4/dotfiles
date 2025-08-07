#!/bin/zsh

# --- Configuration Variables ---
readonly DOTFILES_REPO="https://github.com/olgam4/dotfiles.git"
readonly DOTFILES_DIR="$HOME/dotfiles"
readonly CONFIG_DIR="$HOME/.config"

mkdir -p $CONFIG_DIR

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
    eza
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

  careful_symlink "$DOFILES_DIR/git" "$CONFIG_DIR/git"
  careful_symlink "$DOFILES_DIR/nvim" "$CONFIG_DIR/nvim"

  careful_symlink "$DOFILES_DIR/kitty" "$CONFIG_DIR/kitty"

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

# --- 5. Main Execution Flow ---
echo "🚀 Starting dotfiles installation..."
install_prerequisites
clone_or_update_repo
install_brew_packages
create_symlinks

echo "✅ Dotfiles installation complete!"
echo "✨ Please restart your terminal for all changes to take effect."
