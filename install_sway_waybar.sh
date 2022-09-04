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
       arc-gtk-theme papirus-icon-theme noto-fonts-emoji noto-fonts terminus-font nautilus file-roller \
       gnome-disk-utility python-i3ipc python-requests pamixer polkit-gnome imagemagick jq gedit python-pip \
       foot gammastep geoclue autotiling python-nautilus gvfs-smb google-chrome nwg-bar nwg-wrapper \
       ttf-nerd-fonts-symbols-1000-em nautilus-open-any-terminal grim slurp wl-clipboard simple-scan \
       libreoffice-still libreoffice-still-en-gb hunspell hunspell-en_ca hyphen hyphen-en libmythes \
       mythes-en aurutils sddm sddm-sugar-candy-git

sleep 2

clear
echo "Applying configuration..."
echo
echo "Copying configuration files..."
cp -R .config/* $HOME/.config/
cp .bashrc $HOME/
sudo cp 09-timezone /etc/NetworkManager/dispatcher.d/
sudo cp 90-monitor.conf /etc/X11/xorg.conf.d/
sudo mkdir /etc/sddm.conf.d
sudo cp sddm.conf /etc/sddm.conf.d/
sudo cp theme.conf /usr/share/sddm/themes/sugar-candy/
sleep 2

echo
echo "Applying gsettings..."
sudo glib-compile-schemas /usr/share/glib-2.0/schemas
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal foot
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal keybindings '<Ctrl><Alt>t'
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal new-tab true
sleep 2

echo
echo "Enabling SDDM..."
sudo systemctl enable sddm.service
sleep 5

clear
echo "Installation complete, rebooting..."
sleep 2
reboot
