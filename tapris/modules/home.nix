{
  pkgs,
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
    #ngrok
    #python314Packages.pycec libcec # both are required
    awww
    hellwal
    imagemagick
    jq
    #    moonlight-qt
    mpv
    pwvucontrol
    qt6.qtwayland
    qt6Packages.qt6ct
    quickshell
    rofi
    #valent #if hyprland implements remocon
    wget
    wl-clipboard
    wlogout
    xdg-utils
    #xwayland-satellite # niri
    #samsungtv
    (python314.withPackages (
      ps: with ps; [
        samsungtvws
        yarl
        typer
        wakeonlan
      ]
    ))
  ];
}
