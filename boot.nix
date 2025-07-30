{ config, lib, pkgs, modulesPath, ... }:

{

	boot.loader.systemd-boot.enable = lib.mkForce false;
	boot.loader.efi.canTouchEfiVariables = true;
  
  environment.systemPackages = with pkgs; [
		tpm2-tools
		tpm2-tss
	];

  security.tpm2 = {
		enable = true;
	};


	boot = {
		initrd = {
			availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "tpm"];
			kernelModules = [ "kvmgt" "vfio-iommu-type1" "mdev" "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];
			systemd = {
				enable = true;
				extraBin.tpm2_unseal = "${pkgs.tpm2-tools}/bin/tpm2_unseal"; 
				services.autounlock = {
					wantedBy = ["initrd.target"];
					before = ["zfs-import-pluto.service"];
					serviceConfig.Type = "oneshot";
					unitConfig.DefaultDependencies = false;
					script = "zpool import pluto; tpm2_unseal -c 0x81000003 -p pcr:sha256:0,7 | zfs load-key pluto";
				
				};
			};
		};
		
		kernelModules = [ "kvm-intel" ];
		kernelParams = [ "i915.enable_gvt=1" "i915.enable_guc=0" "intel_iommu=on" "i915.enable_fbc=0" "nvidia_drm.fbdev=1" "nvidia-drm.modeset=1" "i915.enable_psr=0"];
		extraModulePackages = [ ];
		
		kernel.sysctl = {
  				"vm.swappiness" = 60;
  				"vm.page-cluster" = 0;
			};
		
	};
		hardware.enableAllHardware = true;
		hardware.enableAllFirmware = true;
		hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
