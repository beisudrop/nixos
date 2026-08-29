{
  flake.modules.nixos.home-manager = { ... }: {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
  }; # imported in base.nix

  flake.modules.homeManager.system-minimal =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    {
      home.stateVersion = "26.11";
      programs.home-manager.enable = true;
    };
}
