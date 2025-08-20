{
	networking.hostName = "pluto";
	networking.hostId = "00000001";
	
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
