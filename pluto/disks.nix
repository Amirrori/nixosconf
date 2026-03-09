{
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/b346034f-4917-4634-9507-38cab352002c";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/8E9D-EF2A";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

	services.zram-generator = {

		enable = true;

		settings = {
			
			zram0 = {

				compression-algorithm = "lz4";
				zram-size = "min(ram/2,8192)";
				swap-priority = "200";

			};

			zram1 = {

				compression-algorithm = "zstd";
				zram-size = "min(ram,16384)";
				swap-priority = "100";

			};

		};

	};

}
