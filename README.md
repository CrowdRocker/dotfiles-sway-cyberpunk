# 🌆 TokyoNight Cyberpunk Sway Dotfiles

> A sleek, high-performance **Sway (Wayland)** desktop themed in **TokyoNight** with cyberpunk aesthetics, optimized for **AMD gaming (RX 580)** on **Arch Linux**.

![Concept: Cyberpunk Sway Desktop](https://i.imgur.com/V0ZJQ2l.png)
*(Conceptual mockup — your desktop will look like this!)*

---

## 🖼️ Screenshots

| SDDM Login | Desktop Overview |
|-----------|------------------|
| ![SDDM](screenshots/sddm.jpg) | ![Desktop](screenshots/desktop.jpg) |

| Game Launcher (EWW) | nwg-drawer |
|---------------------|----------|
| ![EWW](screenshots/eww-launcher.jpg) | ![Drawer](screenshots/drawer.jpg) |

| Terminal (Alacritty + Starship) |
|---------------------------------|
| ![Terminal](screenshots/terminal.jpg) |

## 🎯 Features

- ✅ **TokyoNight theme** (neon blue, dark navy, clean fonts)
- 🎮 **Game launcher** via EWW grid (Steam, Lutris, Heroic, etc.)
- 🧱 **nwg-dock** & **nwg-drawer** for app launching
- 🖥️ **Waybar** with CPU, RAM, updates, gamemode, power, and more
- 🔊 **PipeWire + Gamemode + Gamescope** for AMD gaming
- 💾 **ZRAM + FSYNC + auto-cpufreq** for performance
- 🎨 **SDDM SugarCandy + GRUB theme** to match
- 🖼️ **Azote** for dynamic wallpaper control
- 🖨️ **Alacritty + Starship + btop + Neofetch** for terminal flair

---

## 💻 System Specs Targeted

- **CPU**: Intel i5-4430 (or similar)
- **GPU**: AMD RX 580 (Vulkan, RADV, FreeSync)
- **RAM**: 8GB+ (ZRAM enabled)
- **WM**: SwayFX (AMD-optimized fork)
- **OS**: Arch Linux (Wayland)

---

## 🚀 Quick Setup

## 🧩 Run the Setup Wizard

```bash
~/.local/bin/setup-wizard.sh

### 1. Install Arch Linux
Ensure base system is installed with internet and `sudo` access.

### 2. Clone & Run Installer
```bash
git clone https://github.com/CrowdRocker/dotfiles-sway-cyberpunk.git
cd dotfiles-sway-cyberpunk
chmod +x install.sh
./install.sh
