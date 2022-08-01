#!/bin/sh

baseurl="https://www.bing.com/"
imageName=$(curl $baseurl"HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-CA" -s | jq '.images[].copyright' --raw-output)
echo $imageName
