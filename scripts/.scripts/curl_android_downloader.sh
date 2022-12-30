#!/bin/bash
adb shell twrp mount system
adb shell twrp remountrw system
curl -o /tmp/curl https://raw.githubusercontent.com/Magisk-Modules-Repo/ccbins/master/curl-arm
adb push /tmp/curl /system/bin/curl
adb shell chmod +x /system/bin/curl
