#!/bin/zsh

# --- Configuration Variables ---
readonly DOTFILES_REPO="https://github.com/olgam4/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

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

prompt_for_dotfiles_dir() {
  DOTFILES_DIR=$(gum input --placeholder "Enter the path to your dotfiles directory:")
  test -n "$DOTFILES_DIR" && DOTFILES_DIR="$DOTFILES_DIR/dotfiles"
}

prompt_for_config_dir() {
  CONFIG_DIR=$(gum input --placeholder "Enter the path to your config directory:")
  test -n "$CONFIG_DIR" && CONFIG_DIR="$CONFIG_DIR/.config"
}

prompt_for_name() {
  NAME=$(gum input --placeholder "Enter your name:")
  test -n "$NAME" && NAME="Olivier Gamache"
}

prompt_for_email() {
  EMAIL=$(gum input --placeholder "Enter your email address:")
  test -n "$EMAIL" && EMAIL="olivier@glo.quebec"
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
    gum
  )
  brew install "${packages[@]}"
}

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

# --- 5. Main Execution Flow ---
echo "🚀 Starting dotfiles installation..."
install_prerequisites
install_brew_packages
prompt_for_dotfiles_dir
prompt_for_config_dir
prompt_for_name
prompt_for_email
clone_or_update_repo
update_git_config
create_symlinks

echo "✅ Dotfiles installation complete!"
echo "✨ Please restart your terminal for all changes to take effect."
