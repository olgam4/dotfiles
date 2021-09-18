if command -v brew; then
  echo "🍺 Brew is already installed!"
  echo "Skipping!"
else
  ./bin/spinner '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"' '🍺 Loading homebrew...'
fi

./bin/spinner "brew update" "  ➡️  updating homebrew..."
./bin/spinner "brew upgrading" "  ➡️  upgrading homebrew..."

echo "Homebrew is installed! 🎉"
echo ""

taps=(
  mas
  zsh
  python
  nvim
)

casks=(
  iterm2
)

for app in "${taps[@]}"; do
  ./bin/spinner "brew install ${app}" "taping into ${app}"
done

for app in "${casks[@]}"; do
  ./bin/spinner "brew install ${app}" "brewing ${app}"
done

