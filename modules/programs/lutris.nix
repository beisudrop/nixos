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
      };
    };
}
