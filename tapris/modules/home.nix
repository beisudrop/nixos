{
  config,
  pkgs,
  inputs,
  ...
}:
let
  vars = import ../vars.nix;
in
{
  home.username = "${vars.userName}";
  home.homeDirectory = "/home/${vars.userName}";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    wget
    moonlight-qt
    pwvucontrol
    #    python313Packages.pycec
    imagemagick
    libcec
    #    ngrok
    rofi
    mpv
    #reaper
    #pywal
    hellwal
    # Hyprland essentials:
    #swaylock-effects
    wl-clipboard
    #grim
    #slurp
    qt6.qtwayland
    xdg-utils
  ];

  qt = {
    enable = true;
    # platformTheme.name = "gtk";
  };
}
