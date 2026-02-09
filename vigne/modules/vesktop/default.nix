{ config, pkgs, ... }:
{
  programs.vesktop.enable = true;
  home.file.".config/vesktop/themes".source = ./themes;
  home.file.".config/vesktop/themes".recursive = true;
}
