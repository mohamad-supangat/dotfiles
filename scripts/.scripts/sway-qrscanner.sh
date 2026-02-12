#!/bin/sh

grim -g "$(slurp)" - | zbarimg - --raw | sed 's/^QR-Code://g' | wl-copy
