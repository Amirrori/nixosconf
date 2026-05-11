{ pkgs, ...}:
{

    environment.systemPackages = with pkgs; [
        qemu_full
    ];

	virtualisation.libvirtd = {
		enable = true;

		qemu = {
			package = pkgs.qemu_kvm;
			runAsRoot = true;
			swtpm.enable = true;
		};
		# hooks.qemu = {
  #     		"gvtg" = ./hook.py;
		# };
	};

}
