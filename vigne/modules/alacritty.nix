{ inputs, pkgs, config, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.8;
      font.normal.family = "MesloLGS Nerd Font Mono";
      font.size = 18;
    };
  };
}
