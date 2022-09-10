#!/bin/sh
exec env WLR_BACKENDS=headless WLR_LIBINPUT_NO_DEVICES=1 WAYLAND_DISPLAY=wayland-1 sway --config ~/.config/sway/remote-config
