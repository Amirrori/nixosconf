{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.shrewd = {
		isNormalUser = true;
		description = import /home/shrewd/.config/nixos/user.secret;
		extraGroups = [ "networkmanager" "wheel" ];
		shell = pkgs.zsh;
		
	};
	users.users.root.shell = pkgs.zsh;

}

