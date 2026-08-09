{
  fileSystems."/" =
    { device = "root";
      fsType = "zfs";
    };

  fileSystems."/home" =
    { device = "root/home";
      fsType = "zfs";
    };


  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/B683-7094";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };


	services.zram-generator = {

		enable = true;

		settings = {
			
			zram0 = {

				compression-algorithm = "lz4";
				zram-size = "min(ram/2,4096)";
				swap-priority = "200";

			};

			zram1 = {

				compression-algorithm = "zstd";
				zram-size = "min(ram,4096)";
				swap-priority = "100";

			};

		};

	};

}
