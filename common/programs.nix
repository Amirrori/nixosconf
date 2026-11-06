{ pkgs, lib, inputs ,... }:
{
# Main essential programs(Rest will be installed through HomeManager)
environment.defaultPackages = lib.mkForce [];
environment.systemPackages = import (inputs.local + "/programs.nix") pkgs;

programs = {
  steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
};
# enable zsh and assign root to use it
	programs.zsh = {
		enable = true;
	};
    services.mullvad-vpn = {
        enable = true;
        package = pkgs.mullvad-vpn;
    };
    services.flatpak.enable = true;
}
