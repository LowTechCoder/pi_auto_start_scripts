#auto backup script
my_date=$(date +'%Y-%m-%d')
cd /media/pi/RA-DATA/rasp_pi_retroarch_conf_backups/
radir="/home/pi/.config/retroarch"
mkdir -p "$my_date/system/"
rsync -r "$radir/system" "$my_date/"
rsync -r "$radir/config" "$my_date/"
rsync -r "$radir/autoconfig" "$my_date/"
rsync -r "$radir/playlists" "$my_date/"
rsync -r "$radir/saves" "$my_date/"
rsync -r "$radir/states" "$my_date/"
rsync -r "$radir/retroarch.cfg" "$my_date/"

#retroarch -f && sudo shutdown now
retroarch -f && echo 'To prevent shutdown, close this window!'; sleep 7;  sudo shutdown now
