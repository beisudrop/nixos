{ pkgs, pkgs-stable, ... }:

{
  services.network-manager-applet.enable = true;
  programs.btop.enable = true;
  # services.awww.enable = true; # broken
  services.cliphist.enable = true;
  services.cliphist.extraOptions = [
    "-max-items"
    "5"
  ];
  programs.quickshell.enable = true;
  qt.enable = true;
  xdg.terminal-exec.enable = true;
  xdg.terminal-exec.settings = { default = [ "kitty.desktop" ]; };

  imports = [
    ../home.nix
    ./alacritty.nix
    ./fastfetch
    ./fcitx5
    ./firefox
    ./fuzzel.nix
    ./ghostty.nix
    ./gtk.nix
    ./hellwal
    ./hypr
    ./kitty.nix
    ./lutris.nix
    ./mako.nix
    ./neovim
    ./niri
    ./reaper.nix
    ./spicetify.nix
    ./stasis.nix
    ./vesktop
    ./yazi.nix
    ./zsh
  ];

  home.packages = with pkgs; [
    pkgs-stable.yabridge
    pkgs-stable.wineWowPackages.yabridge
    pkgs-stable.yabridgectl
    # python314Packages.samsungtvws
    #blueman
    awww
    azahar
    bluez
    curl
    dolphin-emu
    eza # ls
    fd # find
    ffmpeg
    fzf # fuzzy
    hellwal
    heroic
    imagemagick
    jq # json processor
    localsend
    melonds
    mpv
    nil # nix language server
    onlyoffice-desktopeditors
    opencode
    osu-lazer-bin
    perl # für spotx
    pince
    poppler # pdf rendering
    pwvucontrol # pipewire volume
    python3
    qt6Packages.qt6ct # qt control center
    reaper
    resvg # svg support
    ripgrep # grep
    sabnzbd # nzb download
    sshfs # mount filesystem
    tesseract # ocr
    timg
    unrar
    unzip
    vscode-fhs
    wget
    winetricks
    xz # compression
    yt-dlp
    zoxide # cd
    # Niri
    xwayland-satellite
    wl-clipboard
    wlogout
    # Hyprland
    grim
    slurp
    networkmanagerapplet
  ];
}
