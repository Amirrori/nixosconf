{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.shrewd = {
		isNormalUser = true;
		description = import ./user.secret;
		extraGroups = [ "networkmanager" "wheel" ];
		shell = pkgs.zsh;
		
	};
	programs.zsh.enable = true;
	users.users.root.shell = pkgs.zsh;

}

