{ pkgs, ...}:
{
	boot.kernelModules = [ "kvm-intel" ];
	boot.kernelParams = [ "i915.enable_gvt=1" "i915.enable_guc=0" "intel_iommu=on" "i915.enable_fbc=0" "nvidia_drm.fbdev=1" "nvidia-drm.modeset=1" "i915.enable_psr=0"];

		
	environment.systemPackages = with pkgs; [
		acpi
		brightnessctl
	];

	services = {
		logind.lidSwitch = "ignore";
		logind.lidSwitchExternalPower = "ignore";
		
		throttled = {
			enable = true;
			extraConfig = import ./throttled.nix;
		};
	};
	
	imports = [
		./tpm.nix
		./hardware.nix
		./tlp.nix
	];
}
