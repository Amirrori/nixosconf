{ pkgs, inputs, ... }:
{
	users.users.shrewd = {
		isNormalUser = true;
		description = import (inputs.local + "/user.secret");
		extraGroups = [ "networkmanager" "wheel" ];
		shell = pkgs.zsh;
	};
}
