{
  description = "Nixos config flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvim-config = {
      url = "github:DerAnsari/neovim-config";
      flake = false;
    };
  };
  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.sophos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/sophos/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
