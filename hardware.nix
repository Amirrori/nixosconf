{ config, pkgs, ... }:
{

    environment.systemPackages = with pkgs; [
                acpi
                brightnessctl
        ];




    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
    };


        hardware.graphics = {
            enable = true;
            enable32Bit = true;
            extraPackages = with pkgs; [
            intel-media-driver # LIBVA_DRIVER_NAME=iHD
            intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
            libvdpau-va-gl
        ] ;
    };
        environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };

        nixpkgs.config.packageOverrides = pkgs: {
        intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
    };
virtualisation.libvirtd = {
    enable = true;
    qemu = {
        package = (pkgs.qemu_kvm.override {
            libiscsiSupport = true;
        });
        runAsRoot = true;
        swtpm.enable = true;
        ovmf = {
            enable = true;
            packages = [(pkgs.OVMFFull.override {
            secureBoot = true;
            tpmSupport = true;
            msVarsTemplate = true;
        }).fd];
        };
    };
      hooks.qemu = {
      "gvtg" = ./hook.py;
    };
};


  services = {
    logind.lidSwitch = "ignore";
    logind.lidSwitchExternalPower = "ignore";
    
    throttled = {
      enable = true;
      extraConfig = import ./throttled.nix;
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



  fileSystems."/" =
    { device = "root";
      fsType = "zfs";
    };

  fileSystems."/home" =
    { device = "root/home";
      fsType = "zfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/2D45-C80E";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

}
