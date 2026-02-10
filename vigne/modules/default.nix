{pkgs, lib, config, inputs, ...}:

{
  services.network-manager-applet.enable = true;
  programs.btop.enable = true;
  services.swww.enable = true;
  services.cliphist.enable = true;
  services.swayidle.enable = true;
  # services.sunshine.enable = true;
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
    ./lutris.nix
    ./mako.nix
    ./neovim
    ./niri
    #./quickshell
    ./spicetify.nix
    ./vesktop
    ./yazi.nix
    ./zsh
  ];

  home.packages = with pkgs; [
    opencode
    pwvucontrol #pipewire volume
    imagemagick
    ffmpeg
    vscode-fhs
    perl #für spotx
    unzip
    winetricks
    eza #ls
    fzf #fuzzy
    mpv
    wget
    curl
    nil #nix language server
    tesseract #ocr
    sabnzbd #nzb download
    #wob volume overlay
    unrar
    xz #compression
    jq #json processor
    poppler #pdf rendering
    fd #find
    ripgrep #grep
    zoxide #cd
    resvg #svg support
    qt6Packages.qt6ct #qt control center
    # Audio
    reaper
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
