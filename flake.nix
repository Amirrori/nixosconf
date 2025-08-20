{
  	description = "main nix flakes I think(not snatched from hatred :3)";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
		nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
		lanzaboote.url = "github:nix-community/lanzaboote/v0.4.2";
		catppuccin.url = "github:catppuccin/nix";
	};

	outputs = { self, nixpkgs, nixpkgs-unstable, catppuccin, lanzaboote, ... } @ inputs: let
		system = "x86_64-linux";

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
				specialArgs = {inherit inputs;};
				
				modules = [
					({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
					./deimos
				];
			};
		};
	};
}
