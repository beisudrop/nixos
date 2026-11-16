{
  flake.modules.nixos.kde-connect =
    { pkgs, ... }:
    {
      programs.kdeconnect = {
        enable = true;
      };
      services.hypr-kdeconnect-fix = {
        enable = true;
        desktops = [ "umbriel" ];
      };
      xdg.portal.config.hyprland.default = [
        "hyprland"
        "gtk"
      ];
      xdg.portal.config.umbriel.default = [
        "umbriel"
        "gtk"
      ];
    };
}
