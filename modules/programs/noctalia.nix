{
  flake.modules.homeManager.noctalia =
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
}
