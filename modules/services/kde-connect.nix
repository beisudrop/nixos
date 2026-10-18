{
  flake.modules.nixos.kde-connect =
    { pkgs, ... }:
    {
      programs.kdeconnect = {
        enable = true;
      };
      services.hypr-kdeconnect-fix.enable = true;
      xdg.portal.config.hyprland.default = [
        "hyprland"
        "gtk"
      ];
    };
}
