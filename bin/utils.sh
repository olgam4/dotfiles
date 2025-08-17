#!/bin/zsh

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
