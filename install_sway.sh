#!/bin/bash

clear
echo "Starting Desktop Configuration..."
sleep 2

### Connect to the internet ###
clear
echo "Connecting to wifi..."
echo
read -p "Enter wifi SSID: " ssid
read -s -p "Enter passphrase for $ssid: " ssidpass
echo
sudo nmcli device wifi connect "$ssid" password "$ssidpass"
sleep 5

clear
echo "Getting fastest mirrors..."
echo
sudo systemctl start reflector.service
sleep 2

clear
echo "Refreshing keyrings..."
echo
sudo pacman -S archlinux-keyring
sleep 2

clear
echo "Installing YAY..."
echo
cd ~/Downloads
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~/Downloads/SwayWM-Install-Script
sleep 2

clear
echo "Installing sway and related applications..."
echo
yay -S gdm-plymouth network-manager-applet blueman pavucontrol sway swaybg swayidle swaylock swayimg waybar wofi mako arc-gtk-theme \
       papirus-icon-theme noto-fonts-emoji ttf-liberation nautilus file-roller gnome-disk-utility python-i3ipc \
       python-requests pamixer polkit-gnome imagemagick jq gedit python-pip foot dex clight plymouth-git autotiling \
       python-nautilus gvfs-smb microsoft-edge-stable nwg-bar nwg-wrapper ttf-nerd-fonts-symbols nautilus-open-any-terminal

sleep 2

clear
echo "Applying configuration..."
echo
gsettings set org.gnome.desktop.interface gtk-theme "Arc-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Papirus"
cp -R .config/* ~/.config/
chmod +x ~/.config/sway/scripts/*.sh ~/.config/sway/scripts/*.py ~/.config/waybar/scripts/*.sh ~/.config/waybar/scripts/*.py
sudo systemctl enable gdm.service
sudo glib-compile-schemas /usr/share/glib-2.0/schemas
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal foot
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal keybindings '<Ctrl><Alt>t'
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal new-tab true
sudo sed -i 's/HOOKS=(base systemd/HOOKS=(base systemd sd-plymouth/' /etc/mkinitcpio.conf
sudo sed -i 's/quiet/quiet splash vt.global_cursor_default=0/' /boot/loader/entries/arch.conf
sudo plymouth-set-default-theme -R spinfinity
clear
echo "Installation complete, rebooting..."
sleep 2
reboot
