{ pkgs, ... }:
{
	users.users.shrewd = {
		isNormalUser = true;
		description = import ./user.secret;
		extraGroups = [ "networkmanager" "wheel" ];
		shell = pkgs.zsh;
	};
}
