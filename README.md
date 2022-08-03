# SwayWM-Install-Script
The script will install all required packages to ensure that [sway](https://swaywm.org/) and [waybar](https://github.com/Alexays/Waybar) configuration work properly out-of-the-box.  

![2022-08-01T17:00:48,286270604-05:00](https://user-images.githubusercontent.com/50297059/182253406-330ad2f8-2b3f-40b3-86c1-2a2270e2bc19.png)


Waybar configuration inspired by https://github.com/jakehamilton/dotfiles.git

# How to use  
1. Log into Arch Linux.  User must be a member of the wheel and input groups.  
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
### Wallpaper  
Bing Image Of The Day is downloaded and set as wallpaper using swaybg via script [get_bing_image.sh](https://github.com/lgaboury/SwayWM-Install-Script/blob/master/.config/sway/scripts/get_bing_image.sh).  [nwg-wrapper](https://github.com/nwg-piotr/nwg-wrapper) is used to show the image information on the bottom right.  
### Applications/Utilities  
#### Autostarted by sway:
* [dex](https://github.com/jceb/dex) will launch any applications compliant with XDG Autostart specification.  
* [network manager applet](https://gitlab.gnome.org/GNOME/network-manager-applet)  
* [blueman applet](https://github.com/blueman-project/blueman)  
* [autotiling](https://github.com/nwg-piotr/autotiling)  
* 
#### by keybindings:
* [foot]() (Super+enter)  
* [Microsoft Edge]() (Super+W)  
* 
