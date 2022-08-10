# Sway-Waybar-Install-Script  

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
   git clone https://github.com/lgaboury/Sway-Waybar-Install-Script.git
   ```
4. Go into Sway-Waybar-Install-Script folder:  
   ```
   cd Sway-Waybar-Install-Script
   ```
5. Run installation script:  
   ```
   ./install_sway_waybar.sh
   ```
   Note:  Multiple AUR packages are being installed through [YAY](https://github.com/Jguer/yay), so be patient as some of them take a while to build.  
# Main Features  
## Install script  
The script will install all required packages to ensure the configuration works properly out-of-the-box.  
### Main components being installed:  
* [sway](https://swaywm.org/)  
* [waybar](https://github.com/Alexays/Waybar)  
* [gdm](https://wiki.gnome.org/Projects/GDM) will default to an empty GNOME session, so ensure you switch to SWAY before logging in.  
* [plymouth](https://www.freedesktop.org/wiki/Software/Plymouth/)
* various fonts  
## SWAY configuration  
### Applications/Utilities  
#### Autostarted by sway:  
* [swayidle](https://github.com/swaywm/swayidle)  
* [clight](https://github.com/FedeDP/Clight) used to auto adjust brightness and gamma on OLED display. Note: clight uses [geoclue](https://gitlab.freedesktop.org/geoclue/geoclue/-/wikis/home) to detect user's location for gamma adjustments.  
* [network manager applet](https://gitlab.gnome.org/GNOME/network-manager-applet)  
* [blueman applet](https://github.com/blueman-project/blueman)  
* [autotiling](https://github.com/nwg-piotr/autotiling)  
* [get_bing_image.sh](https://github.com/lgaboury/SwayWM-Install-Script/blob/master/.config/sway/scripts/get_bing_image.sh) Bing Image Of The Day is downloaded and set as wallpaper using swaybg.  [nwg-wrapper](https://github.com/nwg-piotr/nwg-wrapper) is used to show the image information on the bottom right.  
* [polkit-gnome](https://gitlab.gnome.org/Archive/policykit-gnome)  
* [mako](https://wayland.emersion.fr/mako/) used as notification daemon configured to display notification top-center.  
* inactive-windows-transparency.py  
#### by keybindings:  
* [foot](https://codeberg.org/dnkl/foot) Wayland terminal emulator (Super+enter)  
* [wofi](https://hg.sr.ht/~scoopta/wofi) (Super+d)  
* [Google Chrome](https://www.google.com/chrome/) (Super+w)  
* [nautilus](https://wiki.gnome.org/Apps/Files) (Super+e)  
* [swaylock](https://github.com/swaywm/swaylock) (Super+Ctrl+l)  
* [nwg-bar](https://github.com/nwg-piotr/nwg-bar) (Super+x).  Presents the user with a choice of Lock, Logout, Reboot and Shutdown.  
* [pamixer](https://github.com/cdemoulins/pamixer) used to increase, decrease and mute volume.  
* [pactl](https://www.freedesktop.org/wiki/Software/PulseAudio/) used to mute microphone.  
* [clight](https://github.com/FedeDP/Clight) manually adjusts display brightness via XF86MonBrightnessDown and XF86MonBrightnessUp.    
* [grim](https://github.com/emersion/grim) grimshot.sh script is used as follows:  
  * Print:  screenshot of active output.  
  * Shift+Print:  screenshot of active window.  
  * Ctrl+Print:  screenshot of manually selected area.  
## WAYBAR configuration  
Waybar configuration inspired by https://github.com/jakehamilton/dotfiles.git  
### Modules  
* [sway workspaces](https://github.com/Alexays/Waybar/wiki/Module:-Sway#workspaces):  
  * large white number indicates focused workspace  
  * large grey number indicates workspace(s) with active window  
  * small grey number indicates persistent workspaces without active window  
* [sway language](https://github.com/Alexays/Waybar/wiki/Module:-Language):  
  * L_Shift+R_Shift will switch the keyboard language layout as defined in the sway config file.  The selected languages must have been defined with locale-gen during your Arch Linux installation.  
* [keyboard state](https://github.com/Alexays/Waybar/wiki/Module:-Keyboard-State):  
  * shows Caps Lock status.  
* custom pacman:  
  * shows number of available packages update (including AUR)  
  * left-click will launch foot terminal emulator with the yay command  
* custom mail:  
  * shows number of unread Google mails via checkgmail.py.  Update the script with your actual username and password.  If using two-step verification on your account, obtain an application password.  
  * left-click will launch Google Chrome pointing to your Gmail Inbox  
* [sway mode](https://github.com/Alexays/Waybar/wiki/Module:-Sway#mode)  
* [clock](https://github.com/Alexays/Waybar/wiki/Module:-Clock)  
* custom weather using [wttr.py](https://github.com/unites/bin/blob/main/waybar-wttr.py):  
  * shows current temperature  
  * hover over will show upcoming forecast  
* [pulseaudio](https://github.com/Alexays/Waybar/wiki/Module:-PulseAudio)  
* custom used mem  
* [backlight](https://github.com/Alexays/Waybar/wiki/Module:-Backlight)  
* [battery](https://github.com/Alexays/Waybar/wiki/Module:-Battery):  
  * discharging: white on black  
  * charging: white on green  
  * warning: black on yellow  
  * critical: blinking white on red, a notification will also be sent  
* [tray](https://github.com/Alexays/Waybar/wiki/Module:-Tray)  
  * netowrk manager applet  
  * blueman applet  
# Acknowledgement  
I would like to recognize all the smart and talented folks who work tirelessly on Arch Linux, Sway, Waybar and all the other programs and utilities used as part of this installation.  
