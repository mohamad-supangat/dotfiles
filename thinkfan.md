Enable thinkfan acpi

```bash
sudo sh -c 'echo "options thinkpad_acpi fan_control=1" > /etc/modprobe.d/thinkfan.conf'
sudo modprobe thinkpad_acpi
```

Thinkfan Config

```
tp_fan /proc/acpi/ibm/fan

# hwmon /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon3/temp6_input
# hwmon /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon3/temp3_input
# hwmon /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon3/temp7_input
# hwmon /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon3/temp4_input
# hwmon /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon3/temp8_input
# hwmon /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon3/temp1_input
# hwmon /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon3/temp5_input
# hwmon /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon3/temp2_input
# hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon4/temp3_input
# hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon4/temp1_input
# hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon4/temp2_input
hwmon /sys/devices/virtual/thermal/thermal_zone0/hwmon1/temp1_input


(2,  0,  50)
(5, 48,  65)
(7,  60, 85)

```
