{
  flake.modules.homeManager.keepass =
    {
      config,
      ...
    }:
    {
      programs.keepassxc = {
        enable = true;
      };
    };
}
