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
      self.modules.nixos.jellyfin
      self.modules.nixos.ssh
      self.modules.nixos.substitutors
      self.modules.nixos.base
      self.modules.nixos.cowsay
      self.modules.nixos.raphielHardware
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
          boot.kernelPackages = pkgs.linuxPackages_latest;
          networking.hostName = host;
          users.users.${user} = {
            isNormalUser = true;
            extraGroups = [ "wheel" ];
          };
          system.stateVersion = "26.05";
        }
      )
    ];
  };
}
