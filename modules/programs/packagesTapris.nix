{
  flake.modules.homeManager.taprisPackages =
    {
      pkgs,
      ...
    }:
    {
      home.packages = with pkgs; [
        hellwal
        jq
        mpv
        pwvucontrol
        qt6.qtwayland
        qt6Packages.qt6ct
        quickshell
        xdg-utils
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
