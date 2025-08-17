#!/bin/zsh

readonly DOTFILES_REPO="https://github.com/olgam4/dotfiles.git"
EMAIL="olivier@glo.quebec"
NAME="Olivier Gamache"
CONFIG_DIR="$HOME/.config"
DOTFILES_DIR="$HOME/dotfiles"

command_exists () {
  command -v "$1" >/dev/null 2>&1
}

echo "--- Checking for prerequisites..."

if ! xcode-select --print-path &> /dev/null; then
    echo "  - Xcode Command Line Tools not found. Installing..."
    xcode-select --install
    # wait for the user to complete the installation

    # accept license
    sudo xcodebuild -license

    # finish Xcode setup
    xcodebuild -runFirstLaunch
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

if [ "$(hidutil property --get 'UserKeyMapping')" == '(null)' ]; then
  echo 'Remapping macOS modifiers...'
  # remap CapsLock to Escape (now)
  ./scripts/remap_macos_modifiers.sh

  # remap CapsLock to Escape (survives system restarts)
  # this was generated using https://hidutil-generator.netlify.app/
  PLIST_TARGET="$HOME/Library/LaunchAgents/com.local.KeyRemapping.plist"

  if [ ! -f "$PLIST_TARGET" ]; then
    sudo cp ./macos/com.local.KeyRemapping.plist "$PLIST_TARGET"
  fi
fi

echo "--- Cloning or updating dotfiles repository..."

if [ -d "$DOTFILES_DIR" ]; then
    echo "  - Dotfiles directory found. Pulling latest changes..."
    git -C "$DOTFILES_DIR" pull
else
    echo "  - Dotfiles directory not found. Cloning..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

echo 'Getting brew packages...'
brew bundle

echo "--- Creating symbolic links..."

careful_symlink "$DOTFILES_DIR/git" "$CONFIG_DIR/git"
careful_symlink "$DOTFILES_DIR/nvim" "$CONFIG_DIR/nvim"

careful_symlink "$DOTFILES_DIR/kitty" "$CONFIG_DIR/kitty"

careful_symlink "$DOTFILES_DIR/starship.toml" "$CONFIG_DIR/starship.toml"

careful_symlink "$DOTFILES_DIR/zsh" "$CONFIG_DIR/zsh"
careful_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
