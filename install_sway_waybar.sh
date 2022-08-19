#!/bin/bash

clear
echo "Starting Desktop Configuration..."
sleep 2

clear
echo "Getting fastest mirrors..."
echo
sudo sed -i 's/#Color/Color/' /etc/pacman.conf
sudo sed -i 's/#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf
sudo systemctl start reflector.service
cat /etc/pacman.d/mirrorlist
sleep 2

clear
echo "Refreshing keyrings..."
echo
sudo pacman -Sy
sudo pacman -S archlinux-keyring
sleep 2

clear
echo "Installing YAY..."
echo
cd ~/Downloads
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~/Downloads/Sway-Waybar-Install-Script
sleep 2

clear
echo "Installing sway and related applications..."
echo
yay -S network-manager-applet blueman pavucontrol sway swaybg swayidle swaylock swayimg waybar wofi mako \
       arc-gtk-theme papirus-icon-theme noto-fonts-emoji ttf-liberation terminus-font nautilus file-roller \
       gnome-disk-utility python-i3ipc python-requests pamixer polkit-gnome imagemagick jq gedit python-pip \
       foot clight geoclue autotiling python-nautilus gvfs-smb google-chrome nwg-bar nwg-wrapper ttf-nerd-fonts-symbols \
       nautilus-open-any-terminal grim slurp wl-clipboard simple-scan

sleep 2

clear
echo "Applying configuration..."
echo
echo "Configuring plymouth..."
sudo sed -i 's/HOOKS=(base systemd /HOOKS=(base systemd sd-plymouth /' /etc/mkinitcpio.conf
sudo plymouth-set-default-theme -R spinfinity
sudo sed -i 's/quiet/quiet splash vt.global_cursor_default=0/' /boot/loader/entries/arch.conf
echo
echo "Configuring geoclue for clight. Enter root password when prompted:"
su -c "cat >> /etc/geoclue/geoclue.conf <<EOF

[clight]
allowed=true
system=true
users=
EOF" root
echo
cp -R .config/* $HOME/.config/
sudo cp 09-timezone /etc/NetworkManager/dispatcher.d/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal foot
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal keybindings '<Ctrl><Alt>t'
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal new-tab true
sudo systemctl enable gdm.service
sleep 5

clear
echo "Installation complete, rebooting..."
sleep 2
reboot
