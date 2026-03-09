{ lib, ... }:
{
# Version, flakes, unfreepackages and network
	system.stateVersion = "25.11";
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	nixpkgs.config.allowUnfree = true;
# Import all the files in the directory
	imports = [
		./boot.nix
		./programs.nix
		./security.nix
	];
}
