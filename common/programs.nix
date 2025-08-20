{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
        vim
        zip
        git
        htop
        sbctl
        e2fsprogs
        tpm2-tools
        qemu_kvm
        python3
	];
	programs.steam = {
       enable = true;
       remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
       dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
       localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfersa
    };
	
	services.mullvad-vpn.enable = true;
	
	fonts.packages = with pkgs; [
        nerd-fonts.fira-code
        nerd-fonts.droid-sans-mono
    ];


	programs.zsh = {
		enable = true;
	};
	
	services.udisks2.enable = true;
	users.users.root.shell = pkgs.zsh;
}
