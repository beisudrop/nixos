{
  flake.modules = {
    homeManager.noctalia =
      {
        pkgs,
        ...
      }:
      {
        programs.noctalia = {
          enable = true;
        };
        home.packages = with pkgs; [ noctalia ];
      };
    nixos.noctalia =
      {
        pkgs,
        ...
      }:
      {
        programs.noctalia = {
          enable = true;
          recommendedServices.enable = true;
        };
      };
  };
}
