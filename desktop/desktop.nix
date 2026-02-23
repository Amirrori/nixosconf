{ lib, config, pkgs, ... }:
{
	programs.hyprland = {
		enable = true;
		withUWSM = false;
		xwayland.enable = true;
	};
	services.displayManager.ly = {
		enable = true;
	};
	
#	programs.regreet = {
#		enable = true;
#		
#		settings = {
#			background.path =  "/etc/greetd/hyprland.png";
#		};
#		
#		
#		font = {
#			name = "Ubuntu";
#			package = pkgs.ubuntu-classic;
#			size = 20;
#		};
#		
#		theme = {
#			name = "catppuccin-mocha-blue-compact";
#			package = pkgs.catppuccin-gtk.override {
#				accents = [ "blue" ];
#				variant = "mocha";
#				size = "compact";
#			};
#		};
#		cursorTheme.name = "adwaita";

#	};
#	
#	users.users.greeter = {
#		isNormalUser = false;
#		description  = "greetd greeter user";
#		extraGroups  = [ "video" "audio" ];
#		linger = true;
#	};
#	environment =
#	{
#		variables = {
#			GSK_RENDERER = "ngl";
#		};
#	};
#	environment.etc."/greetd/hyprland.conf".source = ./regreet.conf;
#	environment.etc."/greetd/hyprland.png".source = ./background.png;
##	
#	services.greetd = {
#		enable =true;
#		package = pkgs.regreet;
#		settings = {
#			default_session = {
#				command = "Hyprland --config /etc/greetd/hyprland.conf";
#				user = "greeter";
#			};
#		};
#	};
	
#	environment.systemPackages = with pkgs; [ regreet ];
	# Enable touchpad support (enabled default in most desktopManager).
    services.libinput.enable = true;

}
