#auto backup script
my_date=$(date +'%Y-%m-%d')
cd /media/pi/USBDRIVE/rasp_pi_retroarch_conf_backups/
mkdir -p "$my_date/system/"
#only back up system once
#rsync -r "/home/pi/snap/retroarch/427/.config/retroarch/system" "$my_date/"
rsync -r "/home/pi/snap/retroarch/427/.config/retroarch/config" "$my_date/"
rsync -r "/home/pi/snap/retroarch/427/.config/retroarch/autoconfig" "$my_date/"
rsync -r "/home/pi/snap/retroarch/427/.config/retroarch/playlists" "$my_date/"
rsync -r "/home/pi/snap/retroarch/427/.config/retroarch/saves" "$my_date/"
rsync -r "/home/pi/snap/retroarch/427/.config/retroarch/states" "$my_date/"

retroarch -f && echo 'To prevent shutdown, close this window!'; sleep 5;  sudo shutdown now
