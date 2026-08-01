{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];      # Options: rosewater, flamingo, pink, mauve, red, maroon, peach, yellow, green, teal, sky, sapphire, blue, lavender
        size = "standard";         # Options: standard, compact
        tweaks = [ "black" ];      # Options: black, rimless, float (optional)
        variant = "mocha";         # Options: latte, frappe, macchiato, mocha
      };
    };
    iconTheme = {
      name = "Dracula";
      package = pkgs.dracula-icon-theme;
    };
    cursorTheme.name = "Bibata-Modern-Ice";
    cursorTheme.size = 24;
    colorScheme = "dark";
  };
}
