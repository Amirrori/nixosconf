{ config, pkgs, ... }:
{
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
