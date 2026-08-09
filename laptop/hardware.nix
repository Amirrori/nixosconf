{ pkgs, ... }:
{


# Console (virtual terminals)
  console.keyMap = "uk";

  # Desktop environments / X11 / Wayland
  services.xserver.xkb = {
    layout = "gb";
  };
	hardware = {
		enableAllHardware = true;
		enableAllFirmware = true;
		
		graphics = {
			enable = true;		
			enable32Bit = true;
			
			extraPackages = with pkgs; [
                mesa
                libva
				libvdpau-va-gl
			];
		};
	};

}

