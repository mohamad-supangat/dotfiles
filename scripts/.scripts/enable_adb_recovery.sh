#!/bin/bash
adb shell twrp mount system
adb shell twrp remountrw system
adb shell 'printf "persist.adb.notify=0\npersist.sys.usb.config=mtp,adb\nro.secure=0\nro.adb.secure=0\nro.debuggable=1\nservice.adb.root=1\npersist.sys.root_access=1\npersist.service.adb.enable=1\nservice.adb.tcp.port=7777" >> /system/build.prop'

adb push ~/.android/adbkey.pub /data/misc/adb/adb_keys
