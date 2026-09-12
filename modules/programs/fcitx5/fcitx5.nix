{
  flake.modules.homeManager.fcitx5 =
    {
      pkgs,
      ...
    }:
    {
      i18n.inputMethod = {
        type = "fcitx5";
        enable = true;
        fcitx5 = {
          addons = with pkgs; [
            fcitx5-mozc
            catppuccin-fcitx5
          ];
          waylandFrontend = true;
        };
      };
      home.file.".config/fcitx5/config".source = ./config;
      home.file.".config/fcitx5/profile".source = ./profile;
      home.file.".config/fcitx5/conf/classicui.conf".source = ./classicui.conf;
    };
}
