{
    host name and id and stuff
    networking.hostName = "pluto";
	networking.hostId = "00000001";
	# import everything from previous files
	imports = [	
		./disks.nix
		../common
		../laptop
		../users/zond.nix
		../virt
		../virt/laptop
		../desktop
	];
}
