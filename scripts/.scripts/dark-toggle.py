#!/usr/bin/python3
import os
import re

config = {
    'gtk': {
        'enable': True,
        'dark': 'Mojave-dark',
        'light': 'Mojave-light',
    },
    'icon': {
        'enable': True,
        'dark': 'Papirus-Dark',
        'light': 'Papirus-Light',
    },
    'alacritty': {
        'enable': True,
    }
}

## dapatkan tema sekarang yang di pakai 
def is_current_dark():
    stream = os.popen("gsettings get org.gnome.desktop.interface gtk-theme")
    gtk_theme = stream.read()
    if 'dark' in gtk_theme:
        return True;
    else:
        return False;


current_dark = is_current_dark();

def target_mode():
    if current_dark:
        return 'light'
    else:
        return 'dark'

def get_target_theme(type):
    return config[type][target_mode()]

## fungsi untuk mengganti gtk theme
def change_gtk_theme():
    print('change gtk theme %s' % get_target_theme('gtk'))
    os.system('gsettings set org.gnome.desktop.interface gtk-theme %s' % get_target_theme('gtk'))


## fungsi untuk mengganti gtk icon
def change_gtk_icon():
    print('change gtk icon %s ' % get_target_theme('icon'))
    os.system('gsettings set org.gnome.desktop.interface icon-theme %s' % get_target_theme('icon'))

def change_alacritty_theme():
    print('change alacritty theme to %s' % target_mode())
    doc = open(os.path.expanduser('~/.config/alacritty/alacritty.yml'), 'r' )
    file = doc.read()
    # Closing the document and opening it again in write mode
    doc.close()
    doc = open(os.path.expanduser('~/.config/alacritty/alacritty.yml'), 'w' )
    if current_dark:
        new_file = re.sub(r"\*dark", "*light", file, flags = re.M)
    else:
        new_file = re.sub(r"\*light", "*dark", file, flags = re.M)
    doc.write(new_file)


## main scripts
if config['gtk']['enable']:
    change_gtk_theme()
if config['icon']['enable']:
    change_gtk_icon()

if config['alacritty']['enable']:
    change_alacritty_theme()
