{
  flake.modules.homeManager.zelelPackages =
    {
      pkgs,
      ...
    }:
    {
      home.packages = with pkgs; [
        jq
        mpv
        pwvucontrol
        qt6.qtwayland
        qt6Packages.qt6ct
      ];
    };
}
