{ pkgs, config, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-teal-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "teal" ];      # Options: rosewater, flamingo, pink, mauve, red, maroon, peach, yellow, green, teal, sky, sapphire, blue, lavender
        size = "standard";         # Options: standard, compact
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
  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
}
