{ pkgs, ...}:
{
    # boot.kernel.sysctl."vm.nr_hugepages" = 8192;

    users.groups.libvirtd.members = ["shrewd"];
    virtualisation.spiceUSBRedirection.enable = true;
    # virtualisation.libvirtd.onBoot = "start";
    virtualisation.podman.enable = true;
	virtualisation.libvirtd = {
		enable = true;

		qemu = {
			package = pkgs.qemu_kvm;
			# runAsRoot = true;
			swtpm.enable = true;
		};
	};

}
