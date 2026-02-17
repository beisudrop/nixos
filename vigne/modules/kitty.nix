{ ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = 0.85;
      background_blur = 1;
    };
    font.name = "MesloLGS Nerd Font Mono";
    font.size = 18;
    extraConfig = ''
      include ~/.cache/hellwal/kitty-colors.conf
    '';
  };
}
