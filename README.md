# SwayWM-Install-Script
The script will install all required packages to ensure that [sway](https://swaywm.org/) and [waybar](https://github.com/Alexays/Waybar) configuration work properly out-of-the-box.  

![2022-08-03T13:25:15,811638319-05:00](https://user-images.githubusercontent.com/50297059/182682027-e45940ed-f2dd-4237-92cb-4a463c3c07fe.png)


# How to use  
1. Log into Arch Linux base system.  User must be a member of the wheel and input groups.  
2. Go into user's Downloads folder:
   ```
   cd ~/Downloads
   ```
2. Connect to the internet.  With my wireless card, I use:
   ```
   nmcli device wifi connect <SSID> password <password>
   ```
   Replace `<SSID>` with your wifi SSID and `<password>` with your password
3. Clone this repository:  
   ```
   git clone https://github.com/lgaboury/SwayWM-Install-Script.git
   ```
4. Go into SwayWM-Install-Script folder:  
   ```
   cd SwayWM-Install-Script
   ```
4. Make install script executable:
   ```
   chmod +x install_sway.sh
   ```
5. Run installation script:  
   ```
   ./install_sway.sh
   ```
# Main Features  
## SWAY configuration  
### Applications/Utilities  
#### Autostarted by sway:
* [swayidle](https://github.com/swaywm/swayidle)  
* [dex](https://github.com/jceb/dex) will launch any applications compliant with XDG Autostart specification.  
* [network manager applet](https://gitlab.gnome.org/GNOME/network-manager-applet)  
* [blueman applet](https://github.com/blueman-project/blueman)  
* [autotiling](https://github.com/nwg-piotr/autotiling)  
* [get_bing_image.sh](https://github.com/lgaboury/SwayWM-Install-Script/blob/master/.config/sway/scripts/get_bing_image.sh) Bing Image Of The Day is downloaded and set as wallpaper using swaybg.  [nwg-wrapper](https://github.com/nwg-piotr/nwg-wrapper) is used to show the image information on the bottom right.  
* [polkit-gnome](https://gitlab.gnome.org/Archive/policykit-gnome)  
#### by keybindings:
* [foot](https://codeberg.org/dnkl/foot) Wayland terminal emulator (Super+enter)  
* [wofi](https://hg.sr.ht/~scoopta/wofi) (Super+d)  
* [Microsoft Edge Stable](https://www.microsoftedgeinsider.com/en-us/download) (Super+w)  
* [nautilus](https://wiki.gnome.org/Apps/Files) (Super+e)  
* [swaylock](https://github.com/swaywm/swaylock) (Super+Ctrl+l)  
* [nwg-bar](https://github.com/nwg-piotr/nwg-bar) (Super+x).  Presents the user with a choice of Lock, Logout, Reboot and Shutdown.  
## WAYBAR configuration  
Waybar configuration inspired by https://github.com/jakehamilton/dotfiles.git  
### Modules  
* sway workspaces
* sway language
* keyboard
* 
