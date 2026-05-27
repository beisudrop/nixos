{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme.package = with pkgs; dracula-theme;
    theme.name = "Dracula";
    iconTheme = {
      package = pkgs.dracula-icon-theme;
      name = "Dracula";
    };
    cursorTheme.name = "Bibata-Modern-Ice";
    cursorTheme.size = 24;
    colorScheme = "dark";
  };
}
