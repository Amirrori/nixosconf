{
   	# host name and id and stuff
	networking.hostName = "pluto";
    # Required for ZFS
	networking.hostId = "007f0200";
	# Removed 2026-10-28: networking.nameservers = ["1.1.1.1" "1.0.0.1"];
	# It never took effect (resolvconf and resolved were both off, so nothing
	# wrote it into /etc/resolv.conf), and with resolved on it would become a
	# global DNS server that any lookup could go to, bypassing the
	# per-connection servers below.

	# networking.firewall.enable = true;
	services.openssh.enable = true;

    # DNS (2026-10-28): systemd-resolved, fed per connection by NetworkManager.
    # The home WiFi profile and the WireGuard profiles use
    # the home resolver (ad blocking + local names); any other
    # network keeps the DNS it hands out. Those per-connection servers live in
    # the NetworkManager profiles (set with nmcli), not here.
    #
    # Replaced: services.resolved.enable = false and
    # networking.resolvconf.enable = false. With both off, /etc/resolv.conf
    # was a static file nothing updated, so the laptop used whatever was
    # written there on every network.
    services.resolved = {
        enable = true;
        settings.Resolve = {
            # The home resolver's upstream (Quad9) already validates DNSSEC;
            # validating again here would break the unsigned local zone
            # and the ad-blocked answers.
            DNSSEC = "false";
            # No link-local name broadcasts (LLMNR) on whatever network the
            # laptop is on.
            LLMNR = "false";
        };
    };
    # Let NetworkManager hand each connection's DNS servers to resolved
    # instead of trying to manage /etc/resolv.conf itself.
    networking.networkmanager.dns = "systemd-resolved";

    services.automatic-timezoned.enable = true;

	# import everything from previous files
	imports = [	
        ./hardware-configuration.nix
		./disks.nix
		./sshd.nix
		../common
		../laptop
		../users/shrewd.nix
		../virt
		../virt/laptop
		../desktop
	];
}
