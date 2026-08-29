{
  self,
  ...
}:
{
  flake = {
    modules.homeManager.kittyBase = { ... }: {
      programs.kitty = {
        enable = true;
        settings = {
          background_opacity = 0.8;
          background_blur = 1;
        };
        font.name = "MesloLGS Nerd Font Mono";
        extraConfig = ''
          include ~/.cache/hellwal/kitty-colors.conf
          adjust_line_height 110%
        '';
      };
    };

    modules.homeManager.kittyVigne = { ... }: {
      imports = [ self.modules.homeManager.kittyBase ];
      programs.kitty.font.size = 18;
    };

    modules.homeManager.kittyTapris = { ... }: {
      imports = [ self.modules.homeManager.kittyBase ];
      programs.kitty.font.size = 22;
    };
  };
}
