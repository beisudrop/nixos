{
  inputs,
  self,
  ...
}:
{
  flake.nixosConfigurations.raphiel = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      host = "raphiel";
      user = "tobias";
    };
    modules = [
      inputs.home-manager.nixosModules.home-manager
    ]
    ++ (with self.modules.nixos; [
      jellyfin
      ssh
      substituters
      base
      cowsay
      raphielHardware
      (
        {
          user,
          host,
          pkgs,
          ...
        }:
        {
          home-manager.extraSpecialArgs = {
            inherit
              inputs
              pkgs
              host
              user
              ;
          };
          home-manager.users.${user} = with self.modules.homeManager; {
            imports = [
              system-minimal
              nvim
              zsh
              yazi
              packagesRaphiel
              fzf
            ];
          };
        }
      )
      (
        {
          pkgs,
          host,
          user,
          ...
        }:
        {
          boot.loader.systemd-boot.enable = true;
          boot.loader.efi.canTouchEfiVariables = true;
          users.users.${user} = {
            isNormalUser = true;
            extraGroups = [
              "wheel"
              "cdrom"
            ];
          };
          system.stateVersion = "26.05";
        }
      )
    ]);
  };
}
