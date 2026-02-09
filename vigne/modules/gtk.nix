{ inputs, pkgs, config, ... }:

{
  gtk = {
    enable = true;
    theme.package = with pkgs; dracula-theme;
    theme.name = "Dracula";
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };
}
