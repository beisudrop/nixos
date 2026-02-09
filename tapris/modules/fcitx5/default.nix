{ inputs, pkgs, config, ... }:
{
 i18n.inputMethod = {
   type = "fcitx5";
   enable = true;
   fcitx5.waylandFrontend = true;
   fcitx5.addons = with pkgs; [
     fcitx5-mozc
#     fcitx5-gtk
   ];
 };
  home.file.".config/fcitx5/config".source = ./config;
  home.file.".config/fcitx5/profile".source = ./profile;
}
