#!/bin/bash
choice=$(echo -e "🔒 Lock\n🛌 Sleep\n⭮ Reboot\n⏻ Shutdown\nLogout" | \
    rofi -dmenu -i -p "Power" -theme ~/.config/rofi/tokyonight.rasi)

case "\$choice" in
  "🔒 Lock") swaylock -f -c 1a1b26 ;;
  "🛌 Sleep")
    swaymsg 'output * dpms off'
    sleep 1
    systemctl suspend
    ;;
  "⭮ Reboot") systemctl reboot ;;
  "⏻ Shutdown") systemctl poweroff ;;
  "Logout") swaymsg exit ;;
esac
