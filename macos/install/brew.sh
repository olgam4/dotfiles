/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew upgrade

apps=(
  mas
  python
  nvim
)

brew install "${apps[@]}"
