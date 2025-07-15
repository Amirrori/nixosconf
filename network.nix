{config, pkgs, lib,... }:
{
    
    networking.hostName = "pluto"; # Define your hostname.
    networking.hostId = "00000001";

    # Enable networking
    networking.networkmanager.enable = true;

    networking.useDHCP = lib.mkDefault true;

}
