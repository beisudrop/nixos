{ pkgs, inputs, ... }:

let
  vars = import ./vars.nix;
in  {
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  fonts.packages = with pkgs; [
  nerd-fonts.meslo-lg
  noto-fonts-cjk-serif
  source-han-sans
  # material-symbols
  # material-icons
  ];

  hardware.enableAllFirmware = true;  # Enable all firmware support, for microcode, idk if needed. redistributable firmware is in hardware-configuration.nix

#  services.displayManager.sddm.wayland.enable = true;
#  services.displayManager.sddm.enable = true;
#  services.displayManager.sddm.extraPackages = with pkgs; [
#    
#  ];

  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
	      command = "${pkgs.niri}/bin/niri-session";
	      user = "${vars.userName}";
      };
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --remember  --asterisks  --container-padding 2 --no-xsession-wrapper --cmd niri-session";
        user = "greeter";
      };
    };
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

  boot.loader.systemd-boot.enable = false;
  boot.loader.systemd-boot.configurationLimit = 3;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.lanzaboote.enable = true;
  boot.lanzaboote.pkiBundle = "/var/lib/sbctl";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "${vars.hostName}";

  networking.networkmanager.enable = true;
  networking.networkmanager.plugins = [ pkgs.networkmanager-openvpn ];
  networking.networkmanager.connectionConfig = {
    "ipv6.method" = "disabled";
  };

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "de_DE.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  console.keyMap = "de";

  users.users.${vars.userName} = {
    isNormalUser = true;
    description = "Tobias";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
  };

  users.defaultUserShell = pkgs.zsh;

  nixpkgs.config.allowUnfree = true;
  security.sudo.wheelNeedsPassword = false;
  security.polkit.enable = true;  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
    flake = inputs.self.outPath;
    flags = [
      "--recreate-lock-file"
    ];
    runGarbageCollection = true;
  };

  #real time audio stuff
  security.rtkit.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
  security.pam.loginLimits = [
    { domain = "@audio"; item = "memlock"; type = "-"   ; value = "unlimited"; }
    { domain = "@audio"; item = "rtprio" ; type = "-"   ; value = "99"       ; }
    { domain = "@audio"; item = "nofile" ; type = "soft"; value = "99999"    ; }
    { domain = "@audio"; item = "nofile" ; type = "hard"; value = "524288"    ; }
  ];  

  programs.niri.enable = true;
  programs.zsh.enable = true;
  programs.steam.enable = true;
  programs.dconf.enable = true; #für gtk
  programs.git.enable = true;
  programs.git.lfs.enable = true;
  programs.nix-ld.enable = true; #fhs compliancy
  programs.nix-ld.libraries = with pkgs; [ stdenv.cc.cc.lib ];
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  environment.systemPackages = with pkgs; [
    osu-lazer-bin
    yt-dlp
    hellwal
    kdePackages.breeze-icons
    material-icons
    material-symbols
    python3
  ];

  environment.sessionVariables = {
    # NIXOS_OZONE_WL = "1"; #unnötig maybe?
    # quickshell
    QT_QPA_PLATFORM= "wayland;xcb";
    QT_QPA_PLATFORMTHEME="qt6ct";
    QT_AUTO_SCREEN_SCALE_FACTOR="1";
  };

  services.xserver.enable = true;
  hardware.graphics.enable = true;
  xdg.portal = {
    enable = true;
    # extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    wlr.enable = true; 
  };

  # services.openssh.enable = true;
  services.libinput.mouse.accelProfile = "flat";
  services.playerctld.enable = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];


  system.stateVersion = "25.11"; # Did you read the comment?

}
