#!/bin/bash
set -euo pipefail

echo "🌆 Installing TokyoNight Cyberpunk Sway Dotfiles..."
read -p "Continue? (y/N): " -n 1 -r
echo
[[ ! \$REPLY =~ ^[Yy]\$ ]] && exit 1

if ! command -v yay &> /dev/null; then
    sudo pacman -Sy --noconfirm git
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
fi

yay -S --needed --noconfirm \
    swayfx-git waybar wofi mako grim slurp \
    alacritty thunar pavucontrol brightnessctl \
    pipewire pipewire-pulse wireplumber \
    polkit-gnome qt5ct qt6ct xdg-desktop-portal-wlr \
    ttf-jetbrains-mono-nerd noto-fonts-emoji \
    zsh starship btop neofetch jq playerctl \
    sddm nwg-look nwg-dock nwg-drawer \
    gamemode gamescope lib32-gamemode \
    vulkan-radeon vulkan-icd-loader mesa lib32-mesa \
    zram-generator rofi-lbonn-wayland \
    azote sddm-sugar-candy-theme auto-cpufreq \
    linux-fsync

systemctl --user enable --now pipewire wireplumber pipewire-pulse gamemoded
sudo systemctl enable sddm
sudo auto-cpufreq --install

rsync -av --exclude='.git' --exclude='install.sh' --exclude='README.md' . ~/
chmod +x ~/.local/bin/*.sh
chmod +x ~/.config/sway/autostart.sh

echo "🎉 Setup complete! Reboot and enjoy."
