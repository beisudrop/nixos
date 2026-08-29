{
  flake.modules.nixos.appimage =
    {
      ...
    }:
    {
      programs.appimage.enable = true;
      programs.appimage.binfmt = true;
    };
}
