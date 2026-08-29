{
  flake.modules.homeManager.taprisPackages =
    {
      pkgs,
      ...
    }:
    {
      home.packages = with pkgs; [
        #ngrok
        #python314Packages.pycec libcec # both are required
        hellwal
        imagemagick
        jq
        #    moonlight-qt
        mpv
        pwvucontrol
        qt6.qtwayland
        qt6Packages.qt6ct
        quickshell
        #valent #if hyprland implements remocon
        wget
        wl-clipboard
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
    };
}
