{
   	# host name and id and stuff
	networking.hostName = "pluto";
	networking.hostId = "007f0200";
	networking.nameservers = ["1.1.1.1" "1.0.0.1"];

	networking.firewall.enable = true;
	services.openssh.enable = true;

	# import everything from previous files
	imports = [	
		./disks.nix
		./sshd.nix
		../common
		../laptop
		../users/shrewd.nix
		../virt
		../virt/laptop
		../desktop
	];
}
