{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme.package = with pkgs; dracula-theme;
    theme.name = "Dracula";

  };
}
