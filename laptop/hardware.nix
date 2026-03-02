{ pkgs, config, ... }:
{
	environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };
	nixpkgs.config.packageOverrides = pkgs: { intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; }; };
	hardware = {
		enableAllHardware = true;
		enableAllFirmware = true;
		opengl.enable = true;
		
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
  # NVIDIA configuration
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = true;
    powerManagement.finegrained = false;

    open = false;
    nvidiaSettings = true;

    prime = {
      offload.enable = false;
      sync.enable = true;
#      offload.enableOffloadCmd = true;

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";

    };
  };
  services.upower.enable = true;
  services.udisks2.enable = true;
  services.udisks2.settings = {
  "udisks2.conf" = {
    program_options = {
      file_manager = "${pkgs.xfce.thunar}/bin/thunar";
    };
  };
};
}

