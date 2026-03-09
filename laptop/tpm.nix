{ pkgs,  ... }:
{	
	security.tpm2.enable = true;
	
	environment.systemPackages = with pkgs; [
		tpm2-tools
		tpm2-tss
	];
	
	boot = {
		initrd = {
			availableKernelModules = [ "tpm" ];
			
			systemd = {
				enable = true;
				extraBin.tpm2_unseal = "${pkgs.tpm2-tools}/bin/tpm2_unseal";
				extraBin.tpm2_pcrextend = "${pkgs.tpm2-tools}/bin/tpm2_pcrextend"; 
				
				services.autounlock = {
					wantedBy = ["initrd.target"];
					before = ["zfs-import-root.service"];
					serviceConfig.Type = "oneshot";
					unitConfig.DefaultDependencies = false;
					
					script = "
						zpool import root;
						tpm2_unseal -c 0x81000003 -p pcr:sha256:0,7 | zfs load-key root;
						tpm2_pcrextend 15:sha256=b5bb9d8014a0f9b1d61e21e796d78dccdf1352f23cd32812f4850b878ae4944c
					";
				};
			};
		};
	};
}

	
