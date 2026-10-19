{
  inputs,
  self,
  ...
}:
{
  flake.nixosConfigurations.tapris = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      host = "tapris";
      user = "amsel";
    };
    modules = [
      inputs.home-manager.nixosModules.home-manager
      inputs.hypr-kdeconnect-fix.nixosModules.default
    ]
    ++ (with self.modules.nixos; [
      ssh
      base
      firefoxTapris
      taprisHardware
      hyprlandUWSM
      ovpn
      appimage
      fonts
      substituters
      xdg-mime
      kde-connect
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
              kittyTapris
              #              hyprlandTapris
              yazi
              noctalia
              gtk
              taprisPackages
              fzf
              qt
              zsh
              nvim
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
          systemd.shutdownRamfs.enable = false;
          boot.kernelParams = [
            "acpi=force" # Force ACPI even if buggy
            "reboot=acpi" # Prefer ACPI reboot
            "acpi_backlight=none" # Avoid backlight conflicts
            "pci=noaer" # Disable PCIe Advanced Error Reporting (can hang)
          ];

          #         services.xserver = {
          #            enable = true;
          #            xkb.layout = "de";
          #          };

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
              "cdrom"
              "audio"
              "sound"
              "network"
              "storage"
            ];
            shell = pkgs.zsh;
          };

          environment.sessionVariables = {
            NIXOS_OZONE_WL = "1";
            QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
            GDK_BACKEND = "wayland,x11";
            QT_QPA_PLATFORM = "wayland;xcb";
            QT_QPA_PLATFORMTHEME = "qt6ct";
            QT_AUTO_SCREEN_SCALE_FACTOR = "1";
            LIBVA_DRIVER_NAME = "iHD"; # Force intel-media-driver
          };

          systemd = {
            # To prevent getting stuck at shutdown
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

          programs.nix-ld.enable = true;

          nixpkgs.config.packageOverrides = pkgs: {
            intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
          };
          hardware.graphics = {
            enable = true;
            extraPackages = with pkgs; [
              intel-media-driver # LIBVA_DRIVER_NAME=iHD
              intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
              libvdpau-va-gl
            ];
          };

          networking.firewall.allowedTCPPorts = [
            47984
            47989
            48010
          ]; # 443
          networking.firewall.allowedTCPPortRanges = [

          ];
          networking.firewall.allowedUDPPorts = [
            47998
            47999
            48000
            48002
            48010
          ];
          networking.firewall.allowedUDPPortRanges = [

          ];
          nix.settings = {
            tarball-ttl = 0;
          };
          system.stateVersion = "26.05";
        }
      )
    ]);
  };
}
