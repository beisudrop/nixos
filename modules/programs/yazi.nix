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
            for = "unix";
          }
        ];
        opener.feh = [
          {
            run = "feh --start-at %s1 %d1";
            block = true;
            desc = "feh";
            for = "unix";
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
