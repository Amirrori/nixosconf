{ pkgs, lib, ...}:
{		
	networking.networkmanager.enable = true;
	networking.useDHCP = lib.mkDefault true;
	boot.kernelModules = [ "kvm-intel" ];
	boot.kernelParams = [ "i915.enable_gvt=1" "i915.enable_guc=0" "intel_iommu=on" "nvidia-drm.modeset=1"];

		
	environment.systemPackages = with pkgs; [
		acpi
		brightnessctl
	];

	services = {
		
		throttled = {
			enable = true;
			extraConfig = import ./throttled.nix;
		};
	};
	
	imports = [
#		./tpm.nix
		./hardware.nix
		./tlp.nix
	];
}
