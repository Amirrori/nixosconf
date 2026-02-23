{ pkgs, config, ... }:
{
	environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };
	nixpkgs.config.packageOverrides = pkgs: { intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; }; };
	hardware = {
		enableAllHardware = true;
		enableAllFirmware = true;
		
		graphics = {
			enable = true;		
			enable32Bit = true;
			
			extraPackages = with pkgs; [
				intel-media-driver
				intel-vaapi-driver 
				libvdpau-va-gl
			];
		};
	};
services.udisks2.enable = true;
services.udisks2.settings = {
  "udisks2.conf" = {
    program_options = {
      file_manager = "${pkgs.xfce.thunar}/bin/thunar";
    };
  };
};
}

