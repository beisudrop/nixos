{
  inputs,
  self,
  ...
}:
{
  flake.nixosConfigurations.tapris = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      host = "zelel";
      user = "tobias";
    };
    modules = [
      inputs.home-manager.nixosModules.home-manager
    ]
    ++ (with self.modules.nixos; [
      ssh
      base
      firefoxTapris
      zelelHardware
      umbriel
      ovpn
      appimage
      fonts
      substituters
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
              kittyVigne
              yazi
              noctalia
              gtk
              zelelPackages
              fzf
              qt
              zsh
              nvim
              xdg-mime
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

          services.pipewire = {
            enable = true;
            pulse.enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
          };

          users.users.${user} = {
            isNormalUser = true;
            extraGroups = [
              "wheel"
              "audio"
              "sound"
              "network"
              "storage"
            ];
            shell = pkgs.zsh;
          };

          environment.sessionVariables = {

          };

          #          programs.nix-ld.enable = true;

          hardware.graphics = {
            enable = true;
          };

          nix.settings = {
            tarball-ttl = 0;
          };
          system.stateVersion = "26.05";
        }
      )
    ]);
  };
}
