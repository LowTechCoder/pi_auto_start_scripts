#auto backup script
do_backup () {

	my_date=$(date +'%Y-%m-%d')
	cd /media/pi/RA-DATA/rasp_pi_retroarch_conf_backups/
	#radir needs to match your setup
	radir="/home/pi/.config/retroarch"
	mkdir -p "$my_date/system/"
	#autoconfig and system are very large backups.  Only enable these once in a while.
	#rsync -r "$radir/autoconfig" "$my_date/"
	#rsync -r "$radir/system" "$my_date/"
	rsync -r "$radir/config" "$my_date/"
	rsync -r "$radir/playlists" "$my_date/"
	rsync -r "$radir/saves" "$my_date/"
	rsync -r "$radir/states" "$my_date/"
	rsync -r "$radir/retroarch.cfg" "$my_date/"
}
#retroarch -f && sudo shutdown now
retroarch -f && echo 'Doing RetroArch backup'; do_backup; echo 'Backup done'; echo 'To prevent shutdown, close this window!'; sleep 7;  sudo shutdown now
