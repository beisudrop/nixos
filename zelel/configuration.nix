{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];


  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };

  boot.kernelPackages = pkgs.linuxPackages; # LTS Kernel

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;
  networking.networkmanager.plugins = with pkgs; [ networkmanager-openvpn ];

  time.timeZone = "Europe/Amsterdam";


  i18n.defaultLocale = "de_DE.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  };

fonts.packages = with pkgs; [
  nerd-fonts.meslo-lg
  noto-fonts-cjk-sans
];

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    windowManager.qtile.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb.layout = "de";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";


  # services.printing.enable = true;


  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
  security.rtkit.enable = true;
  security.pam.loginLimits = [
    { domain = "@audio"; item = "memlock"; type = "-"   ; value = "unlimited"; }
    { domain = "@audio"; item = "rtprio" ; type = "-"   ; value = "99"       ; }
    { domain = "@audio"; item = "nofile" ; type = "soft"; value = "99999"    ; }
    { domain = "@audio"; item = "nofile" ; type = "hard"; value = "524288"    ; }
  ];


  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  users.users.beisu = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" ];
    shell = with pkgs; zsh;
  };
  users.defaultUserShell = pkgs.zsh;

security.sudo.wheelNeedsPassword = false;

services.picom.enable = true;
services.libinput.mouse.accelProfile = "flat";
services.playerctld.enable = true;
services.gvfs.enable = true;
#services.tumbler.enable = true;

programs.steam.enable = true;
programs.nm-applet.enable = true;
programs.zsh.enable = true;
programs.kdeconnect.enable = true;
programs.dconf.enable = true; #für gtk
programs.git.enable = true;
programs.git.lfs.enable = true;
programs.nix-ld.enable = true;
programs.nix-ld.libraries = with pkgs; [ stdenv.cc.cc.lib ];
programs.appimage.enable = true;
programs.appimage.binfmt = true;

  environment.systemPackages = with pkgs; [
#    inputs.quickshell.packages.${pkgs.system}.default
    xfce.thunar
    kdePackages.kate
    rofi
    pwvucontrol
    eza
    fzf
    libnotify
    ffmpeg
    mpv
    spotify
    hellwal
    zip
    unzip
    vscode-fhs
    uv
    python3
    wget
    curl
    #ninja
    #conda
    #python310
    #gcc
    #cmake
    #gnumake
    util-linux
    perl
    osu-lazer
    feh
    tesseract
    parted
    pywalfox-native
    nil
    flameshot
    xclip
    btop
    imagemagick
    ueberzugpp
    sabnzbd
    sbctl # secure boot
  ];


hardware.graphics.enable = true;
hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
services.xserver.videoDrivers = ["nvidia"];
hardware.nvidia.modesetting.enable = true;
hardware.nvidia.open = false;

system.autoUpgrade = {
  enable = true;
  dates = "weekly";
  flake = inputs.self.outPath;
  operation = "boot";
  flags = [
    "--recreate-lock-file"
  ];
};

nix.settings.experimental-features = [ "nix-command" "flakes" ];
nix.settings.auto-optimise-store = true;
nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "--delete-older-than 1w";
};
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;


  system.stateVersion = "25.05";

}

