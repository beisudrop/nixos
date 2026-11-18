{
  inputs,
  self,
  ...
}:
{
  flake.nixosConfigurations.zelel = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      host = "zelel";
      user = "tobias";
    };
    modules = [
      inputs.home-manager.nixosModules.home-manager
      inputs.nixos-hardware.nixosModules.microsoft-surface-pro-intel
    ]
    ++ (with self.modules.nixos; [
      appimage
      base
      firefoxTapris
      fonts
      noctalia
      ovpn
      ssh
      substituters
      umbriel
      zelelHardware
      wvkbd
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
              fzf
              gtk
              kittyVigne
              nvim
              qt
              system-minimal
              xdg-mime
              yazi
              zelelPackages
              zsh
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

          hardware.microsoft-surface.kernelVersion = "longterm";

          services.iptsd = {
            enable = true;
            config = {
              Contacts = {
                SizeMin = 0.100;
                SizeMax = 4.000;
                AspectMin = 1.000;
                AspectMax = 4.000;
                ActivationThreshold = 24;
                DeactivationThreshold = 20;
                OrientationThresholdMax = 5;
              };
            };
          };

          nix.settings = {
            tarball-ttl = 0;
            trusted-users = [
              "root"
              "tobias"
            ];
          };
          system.stateVersion = "26.05";
        }
      )
    ]);
  };
}
