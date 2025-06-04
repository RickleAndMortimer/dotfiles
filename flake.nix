{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  inputs.home-manager = {
    url = "github:nix-community/home-manager/release-24.11";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.nathan-desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [ 
        ./configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          # TODO replace ryan with your own username
          home-manager.users.nathan = import ./home.nix;
        }
      ];
    };
  };
}
