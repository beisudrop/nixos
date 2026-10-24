{
  flake.modules.nixos.sops =
    {
      pkgs,
      user,
      self,
      lib,
      ...
    }:
    {

      sops = {
        age.keyFile = "/home/${user}/.config/sops/age/keys.txt";
        defaultSopsFile = "/home/${user}/nixos/secrets/secrets.yaml";
        defaultSopsFormat = "yaml";
        secrets = lib.genAttrs [ "tv_ip" "joycon_r1" "joycon_l1" ] (_: {
          owner = user;
        });
        validateSopsFiles = false;
      };
    };
  flake.modules.homeManager.sops-test =
    {
      config,
      user,
      inputs,
      ...
    }:
    {
      home-manager.sharedModules = [
        inputs.sops-nix.homeManagerModules.sops
      ];
      sops = {
        age.keyFile = "/home/${user}/.config/sops/age/keys.txt";
        defaultSopsFile = "/home/${user}/nixos/secrets/secrets.yaml";
        defaultSopsFormat = "yaml";
        validateSopsFiles = false;
        secrets."tv_ip" = { };
        secrets."joycon_l1" = { };
      };
    };
}
