{
  flake.modules.nixos.appimage =
    {
      ...
    }:
    {
      programs.appimage.enable = true;
      programs.appimage.binfmt = false; # true for squash false for dwar
    };
}
