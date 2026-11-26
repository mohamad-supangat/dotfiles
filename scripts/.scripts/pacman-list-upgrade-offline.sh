pacman -Sup --cachedir /run/media/deve/f5efd2e4-af3f-4569-ad0b-b4d4c2c739a3 --print-format "%s %n-%v %l" | grep -v " file://" | sort -rn | awk '{printf "%.2f MB\t%s\n", $1/1048576, $2}'
