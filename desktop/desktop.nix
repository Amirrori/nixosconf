{ pkgs,  ... }:
{
	services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
	# Enable touchpad support (enabled default in most desktopManager).
    # services.libinput.enable = true;
    xdg.icons.fallbackCursorThemes = [ "breeze_cursors" ];

    environment.systemPackages = with pkgs; [
        kdePackages.breeze-gtk
        kdePackages.breeze-icons
    ];

    programs.dconf.enable = true;
}
