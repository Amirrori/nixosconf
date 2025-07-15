{ config, pkgs, ... }:

{
	time.hardwareClockInLocalTime = true;
	services.automatic-timezoned.enable = true;
}
