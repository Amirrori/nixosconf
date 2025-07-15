{ pkgs, ... }: {
	boot = {
	consoleLogLevel = 3;
	initrd.verbose = false;
	loader.timeout = 0;

		plymouth = {
			enable = true;
			theme = "catppuccin-mocha";

			themePackages = [(pkgs.catppuccin-plymouth.override{
				variant = "mocha";
			})];
		};

		kernelParams = [
			"quiet"
			"splash"
			"boot.shell_on_fail"
			"udev.log_priority=3"
			"rd.systemd.show_status=auto"
		];
	};
}
