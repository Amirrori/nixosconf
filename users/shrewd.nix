{ pkgs, ... }:
{
	users.users.shrewd = {
		isNormalUser = true;
		description = "Mohammad H Amiri";
		extraGroups = [ "networkmanager" "wheel" ];
		shell = pkgs.zsh;
	};
}
