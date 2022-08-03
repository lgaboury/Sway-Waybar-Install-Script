# SwayWM-Install-Script

![2022-08-01T17:00:48,286270604-05:00](https://user-images.githubusercontent.com/50297059/182253406-330ad2f8-2b3f-40b3-86c1-2a2270e2bc19.png)


Waybar configuration inspired by https://github.com/jakehamilton/dotfiles.git

## How to use  
1. Log into Arch Linux.  User must be a member of the wheel and input groups.  
2. Go into user's Downloads folder:
   ```
   cd ~/Downloads
   ```
2. Connect to the internet.  With my wireless card, I use:
   ```
   nmcli device wifi connect <SSID> password <password>
   ```
   Replace ```<SSID>``` with your wifi SSID and ```<password>``` with your password
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
## Features
