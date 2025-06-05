{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  inputs.home-manager = {
    url = "github:nix-community/home-manager/release-24.11";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  inputs.nixos-hardware.url = "github:NixOS/nixos-hardware/master";

  outputs = inputs @ { self, nixpkgs, home-manager, nixos-hardware, ... }: {
    nixosConfigurations.nathan-desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [ 
        ./audio/audio.nix
        ./graphics/display.nix
        ./graphics/nvidia.nix
        ./hosts/nathan-desktop/configuration.nix
        ./misc/docker.nix
        ./misc/unfree.nix
        ./users/user.nix
        ./user_profiles/gamer.nix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.nathan = import ./users/home_big.nix;
        }
      ];
    };
    nixosConfigurations.nathan-thinkpad = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [ 
        ./audio/audio.nix
        ./bluetooth/bluetooth.nix
        ./graphics/display.nix
        ./hosts/nathan-thinkpad/configuration.nix
        ./misc/docker.nix
        ./misc/unfree.nix
        ./network/networks.nix
        ./users/user.nix
	nixos-hardware.nixosModules.lenovo-thinkpad-t460s
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.nathan = import ./users/home.nix;
        }
      ];
    };
  };
}
