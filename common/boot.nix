{lib, inputs, ... }:
{
# Import Lanzaboote(Handles secureBoot)
	imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];
# Boot related Kernel Modules
	boot = {
		initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "usbhid" "sd_mod"];
#		kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];

		kernelParams = [
			"quiet"
			"splash"
			"boot.shell_on_fail"
			"udev.log_priority=3"
			"rd.systemd.show_status=auto"
			"i915.enable_psr=0"
		 ];
		kernel.sysctl = {
			"vm.swappiness" = 60;
			"vm.page-cluster" = 0;
		};
	# enable lanzaboote
		lanzaboote = {
			enable = true;
			pkiBundle = "/var/lib/sbctl";
		};
	# Make the bootloader systemd-boot
		loader = {
			systemd-boot.enable = lib.mkForce false;
			efi.canTouchEfiVariables = true;
		};
		consoleLogLevel = 3;
		initrd.verbose = false;
		loader.timeout = 7;
	};
}	
