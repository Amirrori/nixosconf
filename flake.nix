{
  	description = "main nix flakes I think";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-26.05";
		lanzaboote.url = "github:nix-community/lanzaboote/v0.4.2";
        local = {
            url = "path:./local-empty";
            flake = false;
        };
	};

	outputs = { nixpkgs,  ... } @ inputs: {
		nixosConfigurations = {
			pluto = nixpkgs.lib.nixosSystem {
				specialArgs = {inherit inputs;};
				
				modules = [
					./pluto
				];
			};
		};
	};
}
