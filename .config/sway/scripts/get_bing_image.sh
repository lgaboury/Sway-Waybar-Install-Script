#!/bin/sh

# exit on error
set -e

# set $SWAYSOCK if it's not set (for systemd or cron)
if [ -z "$SWAYSOCK" ]; then
  export SWAYSOCK=/run/user/$(id -u)/sway-ipc.$(id -u).$(pgrep -x sway).sock
fi

wlpath=${WALLPAPER_PATH:-"$HOME/.config/sway/wallpapers/wallpaper.jpg"}
lswlpath=${LOCK_SCREEN_WALLPAPER_PATH:-"$HOME/.config/sway/wallpapers/lockscreen_wallpaper.jpg"}
output=${WALLPAPER_OUTPUT:-"*"}
baseurl="https://www.bing.com/"

while [ -z $wluri ]; do
    wluri=$(curl $baseurl"HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-CA" -s | jq '.images[].url' --raw-output)
    # wluri=$(curl $baseurl"HPImageArchive.aspx?format=js&idx=0&n=1" -s | jq '.images[].url' --raw-output)
    # sleep 1
done

imageName=$(curl $baseurl"HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-CA" -s | jq '.images[].copyright' --raw-output)

curl "$baseurl$wluri" -s > $wlpath

killall swaybg || true

#feh --bg-fill $wlpath
swaymsg "output $output bg $wlpath fill"

convert $wlpath -filter Gaussian -blur 0x8 -level 10%,90%,0.5 $lswlpath
