{
   	# host name and id and stuff
    networking.hostName = "pluto";
	networking.hostId = "007f0200";
	# import everything from previous files
	imports = [	
		./disks.nix
		../common
		../laptop
		../users/shrewd.nix
		../virt
		../virt/laptop
		../desktop
	];
}
