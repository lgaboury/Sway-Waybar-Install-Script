# SwayWM-Install-Script
The script will install all required packages to ensure that [sway](https://swaywm.org/) and [waybar](https://github.com/Alexays/Waybar) configuration work properly out-of-the-box.  

![2022-08-03T13:25:15,811638319-05:00](https://user-images.githubusercontent.com/50297059/182682027-e45940ed-f2dd-4237-92cb-4a463c3c07fe.png)
![2022-08-03T19:19:55,636265472-05:00](https://user-images.githubusercontent.com/50297059/182737154-d9936b4d-a287-40aa-9f68-8587fffde52f.png)
![2022-08-03T19:20:38,962201014-05:00](https://user-images.githubusercontent.com/50297059/182737182-567a0bb2-a980-476f-a97e-33597ffaab8e.png)

# How to use  
1. Log into Arch Linux base system.  User must be a member of the wheel and input groups.  
2. Go into user's Downloads folder:
   ```
   cd ~/Downloads
   ```
2. Connect to the internet.  With my wireless card, I use:
   ```
   sudo nmcli device wifi connect <SSID> password <password>
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
* [mako](https://wayland.emersion.fr/mako/) used for notification daemon configured to display notification top-center.  
#### by keybindings:
* [foot](https://codeberg.org/dnkl/foot) Wayland terminal emulator (Super+enter)  
* [wofi](https://hg.sr.ht/~scoopta/wofi) (Super+d)  
* [Microsoft Edge Stable](https://www.microsoftedgeinsider.com/en-us/download) (Super+w)  
* [nautilus](https://wiki.gnome.org/Apps/Files) (Super+e)  
* [swaylock](https://github.com/swaywm/swaylock) (Super+Ctrl+l)  
* [nwg-bar](https://github.com/nwg-piotr/nwg-bar) (Super+x).  Presents the user with a choice of Lock, Logout, Reboot and Shutdown.  
* [pamixer](https://github.com/cdemoulins/pamixer) used to increase, decrease and mute volume.  
* [pactl](https://www.freedesktop.org/wiki/Software/PulseAudio/) used to mute microphone.  
* [clight](https://github.com/FedeDP/Clight) used to auto adjust brightness and gamma on OLED display.  Brightness can be manually adjusted via XF86MonBrightnessDown and XF86MonBrightnessUp.  Note: clight uses geoclue to detect user's location for gamma adjustements.  Clight is autostarted via dex.  
* [grim](https://github.com/emersion/grim) grimshot.sh script is used as follows:
  * Print:  screenshot of active output.  
  * Shift+Print:  screenshot of active window.  
  * Ctrl+Print:  screenshot of manually selected area.
## WAYBAR configuration  
Waybar configuration inspired by https://github.com/jakehamilton/dotfiles.git  
### Modules  
More details coming soon...
* sway workspaces
* sway language
* keyboard
# Acknowledgement
I would like to recognize all the smart and talented folks who work tirelessly on Arch Linux, Sway, Waybar and all the other programs and utilities used as part of this installation.
