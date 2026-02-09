{pkgs, lib, config, inputs, ...}:

{
  services.network-manager-applet.enable = true;
  programs.btop.enable = true;
  services.swww.enable = true;
  services.cliphist.enable = true;
  services.swayidle.enable = true;
  # services.sunshine.enable = true;
  programs.vesktop.enable = true;
  programs.quickshell.enable = true;
  qt.enable = true;

  imports = [
    ../home.nix 
    ./alacritty.nix
    ./fastfetch
    ./firefox
    ./fcitx5
    ./fuzzel.nix
    ./ghostty.nix
    ./gtk.nix
    ./hellwal
    #./kdeconnect.nix
    ./kitty.nix
    ./mako.nix
    ./niri
    #./quickshell
    ./vesktop
    ./yazi.nix
    ./zsh
  ];

  home.packages = with pkgs; [
    pwvucontrol
    imagemagick
    ffmpeg
    vscode-fhs
    perl #spotify
    unzip
    winetricks
    eza #ls
    fzf #fuzzy
    mpv
    spotify
    wget
    curl
    nil #nix language server
    tesseract #ocr
    sabnzbd
    #wob volume overlay
    unrar
    xz #compression
    jq #json processor
    poppler #pdf rendering
    fd #find
    ripgrep #grep
    zoxide #cd
    resvg
    qt6Packages.qt6ct #qt control center
    # Audio
    reaper
    guitarix
    yabridge
    yabridgectl
    wineWowPackages.yabridge
    # Niri
    xwayland-satellite
    wl-clipboard
    wlogout
    swaylock
  ];  
}
