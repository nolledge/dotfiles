#! /bin/bash
#xrandr --output eDP1 --mode 1920x1080 --rate 60 --output DP2-2 --mode 1920x1080 --right-of eDP1 --primary 
#xrandr --output eDP1 --mode 1920x1080 --rate 60 --output DP2-2 --mode 2560x1440 --right-of eDP1 --primary 
xrandr --output DP1 --mode 2560x1440 --auto --primary --output eDP1 --auto --right-of DP1
