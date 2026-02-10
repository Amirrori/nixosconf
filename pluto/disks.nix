{
	fileSystems = {
		"/" = { 
			device = "root";
			fsType = "zfs";
		};

		"/home" = { 
			device = "root/home";
			fsType = "zfs";
		};
# WHEN YOU ENCRYPT DISK ON INSTALLATION PUT THE UUID HERE
		"/boot" = {
			device = "/dev/disk/by-uuid/2D45-C80E";
			fsType = "vfat";
			options = [ "fmask=0022" "dmask=0022" ];
		};
	};	
}
