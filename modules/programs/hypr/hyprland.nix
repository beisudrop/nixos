{
  self,
  ...
}:
{
  flake.modules = {
    homeManager.hyprland =
      {
        config,
        pkgs,
        host,
        ...
      }:
      {
        home.packages = with pkgs; [
          grim
          slurp
          wl-clipboard
        ];
        home.file.".config/hypr/hyprland.lua".source = ./${host}.lua;
      };

    nixos.hyprland = { user, pkgs, ... }: {
      programs.hyprland.enable = true;
      services.greetd = {
        enable = true;
        settings = {
          initial_session = {
            command = "${pkgs.hyprland}/bin/start-hyprland";
            user = "${user}";
          };
          default_session = {
            command = "${pkgs.tuigreet}/bin/tuigreet --cmd start-hyprland";
            user = "greeter";
          };
        };
      };
      home-manager.users."${user}".imports = [ self.modules.homeManager.hyprland ];
    };
    nixos.hyprlandUWSM = { user, pkgs, ... }: {
      programs.hyprland.enable = true;
      programs.hyprland.withUWSM = true;
      services.greetd = {
        enable = true;
        settings = {
          initial_session = {
            command = "uwsm start -eD Hyprland hyprland.desktop";
            user = "${user}";
          };
          default_session = {
            command = "${pkgs.tuigreet}/bin/tuigreet --remember --asterisks --container-padding 2 --no-xsession-wrapper --cmd 'uwsm start -eD Hyprland hyprland.desktop'";
            user = "greeter";
          };
        };
      };
      home-manager.users."${user}".imports = [ self.modules.homeManager.hyprland ];
    };
  };
}
