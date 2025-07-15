{
  description = "main nix flakes I think";
  inputs  = {
	nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
	nixpkgs-unstable.url = "nixpkgs/nixos-unstable";


	lanzaboote = {
		url = "github:nix-community/lanzaboote/v0.4.2";

		# Optional but recommended to limit the size of your system closure.
		inputs.nixpkgs.follows = "nixpkgs";
	};
	catppuccin = {
		url = "github:catppuccin/nix";
		inputs.nixpkgs.follows = "nixpkgs";
	};

  };
  outputs = { self, nixpkgs, nixpkgs-unstable, catppuccin, lanzaboote, ... } @ inputs:
	let
		system = "x86_64-linux";
		config.allowUnfree = true;

		overlay-unstable = final: prev: {
			unstable = import nixpkgs-unstable {
         		inherit system;
         		config.allowUnfree = true;
        };
    };
	in {
		nixosConfigurations = {
			pluto = nixpkgs.lib.nixosSystem {
				inherit system;
				specialArgs = { inherit inputs; };
				
				modules = [
					./boot.nix
					./display.nix
					./hardware.nix
					./network.nix
					./locale.nix
					./programs.nix
					./user.nix
					./zram.nix
					./security.nix
					./tlp.nix
					./plymouth.nix
					lanzaboote.nixosModules.lanzaboote
					({ pkgs, lib, ... }: {

						environment.systemPackages = [
							# For debugging and troubleshooting Secure Boot.
							pkgs.sbctl
						];
						boot.loader.systemd-boot.enable = lib.mkForce false;

						boot.lanzaboote = {
							enable = true;
							pkiBundle = "/var/lib/sbctl";
						};
					})
				];
			};
		};
	};
}
