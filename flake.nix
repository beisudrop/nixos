{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    lanzaboote.url = "github:nix-community/lanzaboote/v1.0.0";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";

    musnix.url = "github:musnix/musnix";
    musnix.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, lanzaboote, musnix, home-manager, ... }: 
  let
    mkHost = { name, user, system ? "x86_64-linux", homeModule }: 
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./${name}/configuration.nix
          lanzaboote.nixosModules.lanzaboote
          musnix.nixosModules.musnix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${user} = homeModule;
          }
          ({pkgs, ...}: {
            nixpkgs.overlays = [ (import ./overlays/spotx.nix) ];
          })
        ];
        specialArgs = { inherit inputs; };
      };
  in {
    nixosConfigurations.vigne = mkHost {
      name = "vigne";
      user = "tobias";
      homeModule = import ./vigne/modules;
    };
    nixosConfigurations.zelel = mkHost {
      name = "zelel";
      user = "beisu";
      # system = "aarch64-linux";  # Overrides the default (example)
      homeModule = import ./zelel/modules;
    };
    nixosConfigurations.tapris = mkHost {
      name = "tapris";
      user = "amsel";
      homeModule = import ./tapris/modules;
    };
  };   
}   
#Haniel
#Zelel
#Jophiel
#Tapris
#Vigne
#Raphiel
