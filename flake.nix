{
  description = "NixOS System configuration";

  inputs = {
    # NixOS
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, darwin, home-manager, ... }: {
    nixosConfigurations = {
      obelnix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/obelnix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.tobias = ./users/tobias/home-manager.nix;
            home-manager.extraSpecialArgs = { isDesktop = true; };
          }
        ];
      };
    };

    darwinConfigurations =  {
      yggdrasil  = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./hosts/yggdrasil
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.tobias = ./users/tobias/home-manager.nix;
            home-manager.extraSpecialArgs = { isDesktop = true; };
          }
        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };

    homeConfigurations = {
      wsl = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [ ./users/developer/home-manager.nix ];
      };
    };
  };
}
