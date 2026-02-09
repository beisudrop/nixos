{ inputs, pkgs, config, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = 0.8;
      background_blur = 1;
    };
    font.name = "MesloLGS Nerd Font Mono";
    font.size = 22;
    extraConfig = ''
      include ~/.cache/wal/kitty-colors.conf
    '';
  };
}
