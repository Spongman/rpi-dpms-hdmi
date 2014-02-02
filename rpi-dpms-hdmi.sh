#!/bin/sh
# Raspberry Pi HDMI monitor sleep hack (PiersH)

if [ "$1" != "-d" ]; then

	echo $0 > /tmp/v
	start-stop-daemon --verbose --pidfile /var/run/rpi-dpms-hdmi.pid --name rpi-dpmg-hdmi --background --make-pidfile --nicelevel 5 --exec $0 --start -- -d
	exit 0

fi

xset dpms 150 300 450

function tvon {
	tvservice --preferred
	sleep 1
	fbset -depth 8
	fbset -depth 16
}


MODE=On
while true ; do

	getdpmsinfo

	case "$?" in
		[01])
			# On
			if [ "$MODE" != "On" ]; then
				MODE=On
				tvon
				xrefresh
			fi
			sleep 30
			;;

		[23])
			# Standby/Suspend/Off
			if [ "$MODE" != "Off" ]; then
				MODE=Off
				tvservice --off
			fi
			sleep 1
			;;

		*)
			tvon
			exit $?
			;;
	esac

done

