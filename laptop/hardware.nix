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
	services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {


    modesetting.enable = true;
    powerManagement.finegrained = false;
    open = false;

    powerManagement.enable = true;

    

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.production;

    prime = {
	sync.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
    };
 };


}

	
