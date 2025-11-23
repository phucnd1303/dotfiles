#!/usr/bin/env bash

set -e  # Exit on error
set -u  # Exit on undefined variable

echo "Installing dependencies..."
brew bundle install

echo "Creating directories..."

# Define config directories
CONFIG_DIRS=(
    "$HOME/.config/alacritty"
    "$HOME/.config/eza"
    "$HOME/.config/ghostty"
    "$HOME/.config/lsd"
    "$HOME/.config/starship"
)

# Create directories if they don't exist
for dir in "${CONFIG_DIRS[@]}"; do
    if [ ! -d "$dir" ]; then
        echo "Creating $dir..."
        mkdir -p "$dir"
    fi
done

echo "Stowing configurations..."

# Define stow configurations (source_dir:target_dir)
declare -A STOW_CONFIGS=(
    ["alacritty"]="$HOME/.config/alacritty"
    ["eza"]="$HOME/.config/eza"
    ["ghostty"]="$HOME/.config/ghostty"
    ["lsd"]="$HOME/.config/lsd"
    ["starship"]="$HOME/.config/starship"
    ["zsh"]="$HOME/.zshrc"
)

# Stow each configuration
for config in "${!STOW_CONFIGS[@]}"; do
    echo "Stowing $config..."
    stow -t "${STOW_CONFIGS[$config]}" "$config"
done

echo "✓ Installation complete!"
