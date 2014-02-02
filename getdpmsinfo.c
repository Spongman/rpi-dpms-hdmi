#include <X11/Xlib.h>
#include <X11/extensions/dpms.h>

int main ()
{
	Display *display = XOpenDisplay(NULL);
	if (!display)
		return -1;

	CARD16 power_level;
	BOOL state;

	Status status = DPMSInfo (display, &power_level, &state);

	XCloseDisplay(display);

	if (!status)
		return -2;

	return power_level;
}
