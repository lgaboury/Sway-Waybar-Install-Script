# SwayWM-Install-Script

![2022-08-01T17:00:48,286270604-05:00](https://user-images.githubusercontent.com/50297059/182253406-330ad2f8-2b3f-40b3-86c1-2a2270e2bc19.png)


Waybar configuration inspired by https://github.com/jakehamilton/dotfiles.git

## How to use  
1. Log into Arch Linux.  User must be a member of the wheel and input groups.
2. Connect to the internet.  With my wireless card, I use:
   ```
   iwctl station wlan0 connect <SSID>
   ```
   Replace ```<SSID>``` with your actual wifi SSID.
3. Update pacman databases:
   ```
   pacman -Sy
   ```
4. Install git:
   ```
   pacman -S git
   ```
   
3. Clone this repository:  
   ```
   git clone https://github.com/lgaboury/Arch-Install-Script.git
   ```
4. Go into Arch-Install-Script folder:  
   ```
   cd Arch-Install-Script
   ```
4. Make install script executable:
   ```
   chmod +x install_base_arch_alongside_windows.sh
   ```
5. Run installation script:  
   ```
   ./install_base_arch_alongside_windows.sh
   ```
