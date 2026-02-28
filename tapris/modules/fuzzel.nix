{ config, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        include = "${config.home.homeDirectory}/.cache/hellwal/fuzzel-colors.ini";
        lines = 15;
        width = 40;
        font = "MesloLGL Nerd Font Mono:size=22";
      };
    };
  };
}
