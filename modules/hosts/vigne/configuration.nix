{
  inputs,
  self,
  ...
}:
{
  flake.nixosConfigurations.vigne = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      host = "vigne";
      user = "tobias";
    };
    modules = [
      inputs.home-manager.nixosModules.home-manager
      inputs.lanzaboote.nixosModules.lanzaboote
      inputs.sops-nix.nixosModules.sops
    ]
    ++ (with self.modules.nixos; [
      substituters
      base
      firefoxVigne
      vigneHardware
      hyprland
      lanzaboote
      rtaudio
      sunshine
      ovpn
      appimage
      fonts
      sops
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
              btop
              fastfetch
              fcitx5
              gtk
              hellwal
              kittyVigne
              lutris
              nvim
              noctalia
              packagesVigne
              quickshell
              reaper
              yazi
              zshVigne
              spicetify
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

          hardware.enableAllFirmware = true;
          hardware.bluetooth.enable = false;

          #          services.greetd = {
          #            enable = true;
          #            settings = {
          #              initial_session = {
          #                command = "${pkgs.hyprland}/bin/start-hyprland";
          #                user = "${user}";
          #              };
          #              default_session = {
          #                command = "${pkgs.tuigreet}/bin/tuigreet --cmd start-hyprland";
          #                user = "greeter";
          #              };
          #            };
          #          };

          systemd = {
            settings.Manager.DefaultTimeoutStopSec = "10s";
            services.greetd.serviceConfig = {
              Type = "idle";
              StandardInput = "tty";
              StandardOutput = "tty";
              StandardError = "journal";
              TTYReset = true;
              TTYVHangup = true;
              TTYVTDisallocate = true;
            };
          };

          #          i18n.extraLocaleSettings = {
          #            LC_ADDRESS = "de_DE.UTF-8";
          #            LC_IDENTIFICATION = "de_DE.UTF-8";
          #            LC_MEASUREMENT = "de_DE.UTF-8";
          #            LC_MONETARY = "de_DE.UTF-8";
          #            LC_NAME = "de_DE.UTF-8";
          #            LC_NUMERIC = "de_DE.UTF-8";
          #            LC_PAPER = "de_DE.UTF-8";
          #            LC_TELEPHONE = "de_DE.UTF-8";
          #            LC_TIME = "de_DE.UTF-8";
          #          };

          users.users.${user} = {
            isNormalUser = true;
            description = "Tobias";
            extraGroups = [
              "networkmanager"
              "wheel"
              "audio"
              "input"
              "tty"
            ];
          };

          programs.steam.enable = true;
          programs.dconf.enable = true;
          programs.git.enable = true;
          programs.git.lfs.enable = true;
          programs.nix-ld.enable = true;
          programs.nix-ld.libraries = with pkgs; [
            fontconfig
            gtk3
            libGL
            libXcursor
            libXext
            libXfixes
            libXi
            libXinerama
            libXrandr
            libXrender
            libxcb
            gcc.cc.lib
            icu
            libICE
            libSM
            libX11
            stdenv.cc.cc.lib
            zlib
            qt6.qtbase
          ];

          programs.ente-auth.enable = true;

          environment.sessionVariables = {
            QT_QPA_PLATFORM = "wayland;xcb";
            QT_QPA_PLATFORMTHEME = "qt6ct";
            QT_AUTO_SCREEN_SCALE_FACTOR = "1";
            MESA_SHADER_CACHE_MAX_SIZE = "10G";
            FZF_DEFAULT_COMMAND = "'fd'";
          };

          services.libinput.enable = true;
          services.libinput.mouse.accelProfile = "flat";
          services.playerctld.enable = true;

          networking.firewall.allowedTCPPorts = [ 53317 ];
          networking.firewall.allowedUDPPorts = [ 53317 ];

          system.stateVersion = "25.11";
        }
      )
    ]);
  };
}
