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
    awww
    jq
    wget
    moonlight-qt
    pwvucontrol
    quickshell
    #    python313Packages.pycec
    imagemagick
    libcec
    #    ngrok
    rofi
    mpv
    hellwal
    wl-clipboard
    qt6.qtwayland
    wlogout
    xdg-utils
    xwayland-satellite
    #samsungtv
    (python314.withPackages (ps: with ps; [
      samsungtvws
      yarl
      typer
      wakeonlan
  ]))
  ];

  qt = {
    enable = true;
    # platformTheme.name = "gtk";
  };
}
