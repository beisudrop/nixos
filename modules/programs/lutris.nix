{
  flake.modules.homeManager.lutris =
    {
      osConfig,
      pkgs,
      ...
    }:
    {
      programs.lutris = {
        enable = true;
        steamPackage = osConfig.programs.steam.package;
        runners.yuzu.package = pkgs.eden;
        runners.azahar.package = pkgs.azahar;
        runners.melonds.package = pkgs.melonds;
        runners.dolphin.package = pkgs.dolphin-emu;
      };
    };
}
