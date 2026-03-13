{ pkgs, lib ,... }:
{
# Main essential programs(Rest will be installed through HomeManager)
environment.defaultPackages = lib.mkForce [];
environment.systemPackages = with pkgs; [
    vim
    zip
	sbctl
	perl
    git
	wget
    e2fsprogs
    qemu_kvm
	udiskie
	dunst
	tmux
	rsync
	libgcc
	glfw
	gcc
	libGL
	pkg-config
];
programs = {
  # gamescope = {
  #   enable = true;
  #   capSysNice = true;
  # };
  steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
};
# hardware.xone.enable = true; # support for the xbox controller USB dongle
# services.getty.autologinUser = "shrewd";
# # environment = {
#   loginShellInit = ''
#     [[ "$(tty)" = "/dev/tty1" ]] && /home/shrewd/nixosconf/common/gs.sh
  # '';
# };


# enable zsh and assign root to use it
	programs.zsh = {
		enable = true;
	};
	
#	services.udisks2.enable = true;
	users.users.root.shell = pkgs.zsh;
	services.mullvad-vpn.enable = true;
}
