{lib, pkgs, inputs, ... }:
{
# Import Lanzaboote(Handles secureBoot)
	imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];
# Boot related Kernel Modules
	boot = {
		initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod"];
         kernelPackages = pkgs.linuxPackages; 
         # log_priority 3 is error level logging
         kernelParams = [
            "quiet"
			"splash"
			"boot.shell_on_fail"
			"udev.log_priority=3"
			"rd.systemd.show_status=auto"
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
	# lanzaboote manages systemd-boot.
		loader = {
			systemd-boot.enable = lib.mkForce false;
			efi.canTouchEfiVariables = true;
		};
		consoleLogLevel = 3;
		initrd.verbose = false;
		loader.timeout = 7;
	};
}	
