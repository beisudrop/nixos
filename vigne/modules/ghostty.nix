{ inputs, pkgs, config, ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      font-size = 18;
      background-opacity = 0.8;
    };
  };
}
