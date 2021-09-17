if command -v mas; then
  echo "🎄 we have mas"
else
  exit 1;
fi

if command -v nvim; then
  echo "📘 we have nvim"
else
  exit 1;
fi

if command -v python; then
  echo "🐍 we have python"
else
  exit 1;
fi
