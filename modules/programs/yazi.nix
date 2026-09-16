{
  flake.modules.homeManager.yazi =
    {
      pkgs,
      ...
    }:
    {
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
              run = "feh --fullscreen --start-at %s1 %d1";
              block = true;
              desc = "feh";
            }
          ];
          opener.play = [
            {
              run = "mpv --hwdec=auto-safe --fs %s";
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
      home.packages = with pkgs; [
        feh
        mpv
      ];
    };
}
