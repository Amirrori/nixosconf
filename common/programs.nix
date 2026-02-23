{ pkgs, ... }:
{
# Main essential programs(Rest will be installed through HomeManager)
	environment.systemPackages = with pkgs; [
        vim
        zip
        git
	wget
        e2fsprogs
        qemu_kvm
	udiskie
	dunst
	];
# Steam, disabled for now try to implement into home manager

#	programs.steam = {
#       enable = true;
#       remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
#       dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
#       localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfersa
#    };

# Same issue as Steam, implement into homemanager

#	services.mullvad-vpn.enable = true;
#	
#	fonts.packages = with pkgs; [
#        nerd-fonts.fira-code
#        nerd-fonts.droid-sans-mono
#    ];

# enable zsh and assign root to use it
	programs.zsh = {
		enable = true;
	};
	
#	services.udisks2.enable = true;
	users.users.root.shell = pkgs.zsh;
	 services.mullvad-vpn.enable = true;
}
