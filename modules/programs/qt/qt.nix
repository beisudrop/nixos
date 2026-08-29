{
  flake.modules.homeManager.qt =
    {
      config,
      ...
    }:
    {
      qt.enable = true;
      home.file.".config/qt6ct".source = ./qt6ct;
      home.file.".config/qt6ct".recursive = true;
    };
}
