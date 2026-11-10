{ pkgs, lib, ...}:
{		
	networking.networkmanager.enable = true;
	# networking.useDHCP = lib.mkDefault true;
	# boot.kernelModules = [ "kvm-amd" ];
    systemd.services.NetworkManager-wait-online.enable = false;
		
	
	imports = [
		./hardware.nix
	];
}
