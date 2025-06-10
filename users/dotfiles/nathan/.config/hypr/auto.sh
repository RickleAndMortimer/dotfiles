#!/bin/sh

handle() {
  case $1 in
    workspacev2*) hyprctl hyprpaper reload eDP-1,~/Pictures/everforest/forest-${1#*,}.jpg ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
