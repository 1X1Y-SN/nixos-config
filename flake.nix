{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  }: let
    system = "x86_64-linux";
    hosts = {
      T-T = "steven";
    };
    mkHost = hostName: user:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit hostName user;
        };
        modules = [
          ./hosts/${hostName}/configuration.nix
          ./hosts/${hostName}/hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${user} = {
              config,
              pkgs,
              ...
            }:
              import ./home/${user}/home.nix {
                inherit config pkgs hostName user;
              };
          }
        ];
      };
    nixosConfigurations = builtins.listToAttrs (
      builtins.map (
        hostName: let
          user = hosts.${hostName};
        in {
          name = hostName;
          value = mkHost hostName user;
        }
      ) (builtins.attrNames hosts)
    );
  in {
    inherit nixosConfigurations;
  };
}
