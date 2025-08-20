{
	fileSystems = {
		"/" = { 
			device = "root";
			fsType = "zfs";
		};

		#"/nix" = {
		#	device = "root/nix";
		#	fsType = "zfs";
		#};
	
		"/home" = { 
			device = "root/home";
			fsType = "zfs";
		};
    
		#"/var/lib/libvirt/images" = {
		#	device = "root/images";
		#	fsType = "zfs";
		#};

		"/boot" = {
			device = "/dev/disk/by-uuid/2D45-C80E";
			fsType = "vfat";
			options = [ "fmask=0022" "dmask=0022" ];
		};
	};	
}
