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

apps=(
  mas
  python
  nvim
)

for app in "${apps[@]}"; do
  ./bin/spinner "brew install ${app}" "brewing ${app}"
  echo ""
done

