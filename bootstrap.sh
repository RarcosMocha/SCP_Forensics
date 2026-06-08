#!/usr/bin/env bash

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "[*] Installing packages..."

sudo dnf install -y \
    zsh \
    kitty \
    fastfetch \
    tar

echo "[*] Creating directories..."

mkdir -p ~/.config
mkdir -p ~/.themes
mkdir -p ~/.icons

echo "[*] Installing ZSH configuration..."

cp "$REPO_DIR/zsh/.zshrc" ~/.zshrc

echo "[*] Installing Kitty configuration..."

mkdir -p ~/.config/kitty
cp "$REPO_DIR/kitty/kitty.conf" \
   ~/.config/kitty/

echo "[*] Installing Fastfetch configuration..."

mkdir -p ~/.config/fastfetch
cp "$REPO_DIR/fastfetch/config.jsonc" \
   ~/.config/fastfetch/

echo "[*] Installing theme..."

cp -r \
   "$REPO_DIR/themes/Greybird-dark" \
   ~/.themes/

echo "[*] Installing icons..."

tar -xf \
    "$REPO_DIR/icons/papirus-icon-theme-black-folders.tar.xz" \
    -C ~/.icons

echo "[*] Installing wallpaper..."

mkdir -p ~/Pictures/Wallpapers

cp \
   "$REPO_DIR/wallpapers/17021881.jpg" \
   ~/Pictures/Wallpapers/

echo "[*] Restoring XFCE configuration..."

mkdir -p ~/.config

cp -r \
   "$REPO_DIR/xfce/xfce4" \
   ~/.config/

echo "[*] Applying appearance..."

xfconf-query \
    -c xsettings \
    -p /Net/ThemeName \
    -s "Greybird-dark"

echo
echo "[+] Done."
echo "[+] Log out and back in to reload XFCE."
