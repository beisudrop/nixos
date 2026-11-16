{
  flake.modules.homeManager.fuzzel =
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
