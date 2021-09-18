if ! mas account 1> /dev/null; then
    echo "Please open the App Store app and sign in using your Apple ID..."
    until mas account 1> /dev/null; do
        sleep 5
    done
fi

# Install BetterSnapTool
mas install 417375580
