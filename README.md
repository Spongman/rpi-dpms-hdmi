rpi-dpms-hdmi
=============

Automatically power off hdmi monitors on a raspberry pi

This script is started by lightdm and waits for the DPMS blanking to switch to Suspend or Off. When either of those states are detected it uses the tvservice command to switch off the LCD backlight.

Adjust the DPMS timeout values in the rpi-dpms-hdmi.sh script. The default values are 150 seconds (2.5 minutes) for DPMS blank, 300 seconds (5 minutes) for HDMI off.


installation
--

```
make
sudo make install
sudo reboot
```
