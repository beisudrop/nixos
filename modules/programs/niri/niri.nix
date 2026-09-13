{
  self,
  ...
}:
{
  flake.modules = {
    homeManager.niri =
      {
        config,
        pkgs,
        host,
        ...
      }:
      {
        home.packages = with pkgs; [
          xwayland-satellite
          wl-clipboard
        ];
        home.file.".config/niri.kdl".source = ./${host}.kdl;
      };

    nixos.niri = { user, pkgs, ... }: {
      programs.niri.enable = true;
      services.greetd = {
        enable = true;
        settings = {
          initial_session = {
            command = "${pkgs.niri}/bin/niri-session";
            user = "${user}";
          };
          default_session = {
            command = "${pkgs.tuigreet}/bin/tuigreet --cmd niri-session";
            user = "greeter";
          };
        };
      };
      home-manager.users."${user}".imports = [ self.modules.homeManager.niri ];
    };
  };
}
