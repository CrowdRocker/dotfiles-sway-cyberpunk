#!/bin/bash
set -euo pipefail

# Install dialog if not present
if ! command -v dialog &> /dev/null; then
    echo "Installing dialog..."
    sudo pacman -S --needed --noconfirm dialog
fi

# Colors
C="\033[1;36m"  # Cyan
G="\033[1;32m"  # Green
Y="\033[1;33m"  # Yellow
R="\033[1;31m"  # Red
N="\033[0m"     # Reset

# Title
TITLE="🌆 TokyoNight Cyberpunk Setup Wizard"

exec 3>&1

# Main menu
CHOICE=$(
    dialog \
        --backtitle "$TITLE" \
        --clear \
        --title "🚀 Welcome" \
        --menu "Choose an option:" 14 60 4 \
        "install" "Install full dotfiles & packages" \
        "deploy"  "Deploy configs only (no install)" \
        "backup"  "Backup existing configs" \
        "theme"   "Apply TokyoNight theme" \
        2>&1 1>&3
)

case "$CHOICE" in
    install)
        dialog --title "📦 Installing Packages" --infobox "Installing required packages..." 5 50
        ./install.sh
        ;;
    deploy)
        dialog --title "📁 Deploying Configs" --infobox "Copying configs to ~/.config..." 5 50
        rsync -av --exclude='.git' --exclude='install.sh' --exclude='README.md' . ~/
        find ~/.local/bin -type f -exec chmod +x {} \;
        dialog --msgbox "✅ Configs deployed!" 6 50
        ;;
    backup)
        dialog --title "💾 Backup" --infobox "Backing up ~/.config..." 5 50
        [[ -d ~/.config_backup ]] || mkdir ~/.config_backup
        rsync -av ~/.config/ ~/.config_backup/ 2>/dev/null || true
        dialog --msgbox "✅ Backup saved to ~/.config_backup" 6 50
        ;;
    theme)
        dialog --title "🎨 Apply Theme" --yesno "Run nwg-look to apply TokyoNight theme?" 6 60
        if [ $? -eq 0 ]; then
            if command -v nwg-look &> /dev/null; then
                nwg-look
            else
                dialog --msgbox "❌ nwg-look not installed. Run install.sh first." 6 50
            fi
        fi
        ;;
    *)
        dialog --msgbox "👋 Goodbye! Use ./install.sh anytime." 6 50
        ;;
esac

exec 3<&-
clear
