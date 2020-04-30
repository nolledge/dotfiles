#!/bin/sh
#             _       _ _            
#       __  _(_)_ __ (_) |_ _ __ ___ 
#       \ \/ / | '_ \| | __| '__/ __|
#        >  <| | | | | | |_| | | (__ 
#       /_/\_\_|_| |_|_|\__|_|  \___|
                             

# start some nice programs
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
# conky -d -c $HOME/.config/polybar/conky_wrapper
dunst -config $HOME/.config/dunst/dunstrc &
#compton -b --config $HOME/.compton.conf 
#nitrogen --restore 2> /dev/null &
#source .local/bin/dwm-status &

# Settings for Japanese input
export GTK_IM_MODULE='ibus'
export QT_IM_MODULE='ibus'
export XMODIFIERS=@im='ibus'

export GTK_IM_MODULE_FILE=/usr/lib/gtk-3.0/3.0.0/immodules.cache

#Toolbar for anthy
#ibus-daemon -drx
exec  i3
