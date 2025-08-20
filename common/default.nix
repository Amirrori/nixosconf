{ lib, ... }:
{
	system.stateVersion = "25.05";
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	nixpkgs.config.allowUnfree = true;
	networking.networkmanager.enable = true;
	networking.useDHCP = lib.mkDefault true;
	
	imports = [
		./boot.nix
		./programs.nix
		./security.nix
	];
}
