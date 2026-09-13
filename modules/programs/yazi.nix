{
  flake.modules.homeManager.yazi = {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        opener.edit = [
          {
            run = "nvim %s";
            block = true;
            desc = "nvim";
          }
        ];
        opener.feh = [
          {
            run = "feh --start-at %s1 %d1";
            block = true;
            desc = "feh";
          }
        ];
        opener.play = [
          {
            run = "mpv --fs %s";
            orphan = true;
            desc = "Play";
          }
        ];
        open.prepend_rules = [
          {
            mime = "image/*";
            use = "feh";
          }
        ];
      };
    };
  };
}
