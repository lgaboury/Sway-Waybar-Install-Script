#!/bin/bash

# to run this script
# cd in user Downloads folder
# mkdir usb
# sudo mount /dev/sda1 ./usb
# cd Arch
# ./configure_desktop.sh

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
sudo cp ~/Downloads/usb/Arch/reflector.conf /etc/xdg/reflector/
sudo systemctl start reflector.service
sleep 2

clear
echo "Refreshing keyrings..."
echo
sudo pacman -S archlinux-keyring
sleep 2

#clear
#echo "Installing YAY..."
#echo
#cd ~/Downloads
#git clone https://aur.archlinux.org/yay.git
#cd yay
#makepkg -si
cd ~/Downloads/usb
#sleep 2

clear
echo "Installing sway and related applications..."
echo
yay -S gdm network-manager-applet blueman pavucontrol sway swaybg swayidle swaylock waybar wofi mako arc-gtk-theme \
       papirus-icon-theme noto-fonts-emoji ttf-inconsolata nautilus file-roller gnome-disk-utility python-i3ipc \
       python-requests pamixer brightnessctl polkit-gnome imagemagick jq gedit python-pip foot \
       python-nautilus gvfs-smb microsoft-edge-stable nwg-bar nwg-wrapper ttf-nerd-fonts-symbols nautilus-open-any-terminal

sleep 2

clear
echo "Applying configuration..."
echo
gsettings set org.gnome.desktop.interface gtk-theme "Arc-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Papirus"
cp -R ~/Downloads/usb/Arch/.config/* ~/.config/
cp ~/Downloads/usb/Arch/.bashrc ~/
cp ~/Downloads/usb/Arch/.bash_profile ~/
#sudo cp ~/Downloads/usb/Arch/tlp.conf /etc/tlp.conf
#sudo systemctl restart tlp.service
sudo systemctl enable gdm.service
sudo glib-compile-schemas /usr/share/glib-2.0/schemas
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal foot
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal keybindings '<Ctrl><Alt>t'
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal new-tab true


#clear
#echo "Installation complete, rebooting..."
#sleep 2
#reboot
