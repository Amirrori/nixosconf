{ config, pkgs, ... }:
{
    system.stateVersion = "25.05";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

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
    nixpkgs.config.allowUnfree = true;
    services.mullvad-vpn.enable = true;
    services.openssh.enable = true;
    fonts.packages = with pkgs; [
        nerd-fonts.fira-code
        nerd-fonts.droid-sans-mono
    ];
    hardware.xone.enable = true; # support for the xbox controller USB dongle
    services.getty.autologinUser = "shrewd";
    environment = {
        loginShellInit = ''
    	    [[ "$(tty)" = "/dev/tty1" ]] && ./gs.sh
        '';
    };
}
