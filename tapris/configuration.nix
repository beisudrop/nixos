{ config, lib, pkgs, inputs, ... }:
let
  vars = import ./vars.nix;
in 
{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  fonts.packages = with pkgs; [
    nerd-fonts.meslo-lg
    nerd-fonts.jetbrains-mono
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  systemd.shutdownRamfs.enable = false;
  boot.kernelParams = [
    "acpi=force"       # Force ACPI even if buggy
    "reboot=acpi"      # Prefer ACPI reboot
    "acpi_backlight=none"  # Avoid backlight conflicts
    "pci=noaer"        # Disable PCIe Advanced Error Reporting (can hang)
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.extraModulePackages = [ config.boot.kernelPackages.r8168 ];
  boot.blacklistedKernelModules = [ "r8169" ];
  nixpkgs.config.allowBroken = true;

  networking.hostName = "${vars.hostName}";

  networking.networkmanager.enable = true;
  networking.networkmanager.plugins = with pkgs; [ networkmanager-openvpn ];
  networking.networkmanager.connectionConfig = {
    "ipv6.method" = "disabled";
  };

  time.timeZone = "Europe/Amsterdam";
  i18n = {
    defaultLocale = "de_DE.UTF-8";
  };

  console = {
     font = "Lat2-Terminus16";
    # keyMap = "de";
    useXkbConfig = true;
  };

  services.xserver = {
    enable = true;
    windowManager.qtile.enable = false;
    xkb.layout = "de";
  };

  security.rtkit.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
  };

  users.users.${vars.userName} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "sound" "network" "storage" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
 
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
    };
  };

  security.polkit.enable = true;

  services = {
    dbus.enable = true;
    gvfs.enable = true;    # Mounting devices
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    GDK_BACKEND = "wayland,x11";
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  services.displayManager.sddm.enable = true;

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  security.sudo.wheelNeedsPassword = false;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    tree
  ];

  services.openssh = {
    enable = true;
    settings.X11Forwarding = true;
    settings.X11UseLocalhost = false;
  };

  programs.ydotool.enable = true;
  programs.ydotool.group = "network";
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
  environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; }; # Force intel-media-driver

  musnix.enable = true;

  networking.firewall.allowedTCPPorts = [ 22 443 ];
  networking.firewall.allowedTCPPortRanges = [ { from = 1717;
                                                 to = 1764; } ];
  networking.firewall.allowedUDPPortRanges = [ { from = 1717;
                                                 to = 1764; } ];

  system.stateVersion = "25.05";

}

