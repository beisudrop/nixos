{
  flake.modules.nixos.sops =
    {
      pkgs,
      user,
      self,
      ...
    }:
    {

      sops = {
        age.keyFile = "/home/${user}/.config/sops/age/keys.txt";
        defaultSopsFile = "/home/${user}/nixos/secrets/secrets.yaml";
        defaultSopsFormat = "yaml";
        secrets.example-key = {
          owner = user;
        };
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
        secrets."example-key" = { };
      };
    };
}
