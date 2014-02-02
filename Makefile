CFLAGS=-O2
LDFLAGS=-lX11 -lXext

getdpmsinfo: getdpmsinfo.o

install: getdpmsinfo
	install -t /usr/local/bin getdpmsinfo
	install -t /usr/local/bin rpi-dpms-hdmi.sh
	sed -i -e '/^display-setup-script=\/usr\/local\/bin\/rpi-dpms-hdmi.sh/d' -e 's/^display-setup-script.*/#&/' -e '/^\[SeatDefaults\]/a display-setup-script=/usr/local/bin/rpi-dpms-hdmi.sh' /etc/lightdm/lightdm.conf
