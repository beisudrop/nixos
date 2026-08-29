{
  flake.modules.homeManager.hellwal =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      home.packages = with pkgs; [ hellwal ];
      home.file.".config/hellwal/themes".source =
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/modules/programs/hellwal/themes";
      home.file.".config/hellwal/templates".source =
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/modules/programs/hellwal/templates";
    };
}
