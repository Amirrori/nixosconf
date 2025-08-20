{ pkgs, ...}:
{
	virtualisation.libvirtd = {
		enable = true;

		qemu = {
			package = pkgs.qemu_kvm;
			runAsRoot = true;
			swtpm.enable = true;

			ovmf = {
				enable = true;

				packages = [(pkgs.OVMFFull.override {
					secureBoot = true;
					tpmSupport = true;
				}).fd];
			};
		};
		hooks.qemu = {
      		"gvtg" = ./hook.py;
		};
    };

}
