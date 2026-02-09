{ config, pkgs, ... }:
{
  home.file.".config/vesktop/themes".source = ./themes;
  home.file.".config/vesktop/themes".recursive = true;
}