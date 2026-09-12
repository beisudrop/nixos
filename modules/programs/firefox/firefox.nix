{
  self,
  lib,
  ...
}:
{
  flake.modules = lib.mkMerge [
    {
      homeManager.firefoxBase = {
        programs.firefox = {
          enable = true;
          package = null;
          profiles.default = {
            userChrome = builtins.readFile ./userChrome.css;
            userContent = builtins.readFile ./userContent.css;
          };
        };
      };
    }
    {
      nixos.firefoxTapris = { user, ... }: {
        programs.firefox = {
          enable = true;
          autoConfig = builtins.readFile ./user.js;
          policies = import ./_policiesTapris.nix;
        };
        home-manager.users."${user}".imports = [ self.modules.homeManager.firefoxBase ];
      };
    }
    {
      nixos.firefoxVigne = { user, ... }: {
        programs.firefox = {
          enable = true;
          autoConfig = builtins.readFile ./user.js;
          policies = import ./_policiesVigne.nix;
        };
        home-manager.users."${user}".imports = [ self.modules.homeManager.firefoxBase ];
      };
    }
  ];
}
