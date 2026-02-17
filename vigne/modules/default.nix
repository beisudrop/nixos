{ pkgs, ...}:

{
  services.network-manager-applet.enable = true;
  programs.btop.enable = true;
  services.swww.enable = true;
  services.cliphist.enable = true;
  services.cliphist.extraOptions = [
    "-max-items"
    "5"
  ];
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
    ./kitty.nix
    ./lutris.nix
    ./mako.nix
    ./neovim
    ./niri
    ./spicetify.nix
    ./vesktop
    ./yazi.nix
    ./zsh
  ];

  home.packages = with pkgs; [
    #wob volume overlay
    curl
    eza #ls
    fd #find
    ffmpeg
    fzf #fuzzy
    imagemagick
    jq #json processor
    mpv
    nil #nix language server
    opencode
    perl #für spotx
    poppler #pdf rendering
    pwvucontrol #pipewire volume
    qt6Packages.qt6ct #qt control center
    resvg #svg support
    ripgrep #grep
    sabnzbd #nzb download
    tesseract #ocr
    unrar
    unzip
    vscode-fhs
    wget
    winetricks
    xz #compression
    zoxide #cd
    # Audio
    reaper
    # yabridge
    # yabridgectl
    # wineWow64Packages.yabridge
    # Niri
    xwayland-satellite
    wl-clipboard
    wlogout
    swaylock
  ];  
}
