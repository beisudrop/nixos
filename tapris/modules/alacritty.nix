{ inputs, pkgs, config, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      general.import = ["${config.home.homeDirectory}/.cache/wal/colors.toml"];
      window.opacity = 0.8;
      font.normal.family = "MesloLGS Nerd Font Mono";
      font.size = 22;
    };
  };
}
