{ config, ... }: {
  services.mako.enable = true;
  services.mako.settings = {
    include = "${config.home.homeDirectory}/.cache/hellwal/mako-colors";   
    default-timeout = 15000;
    border-radius = 16;
    "urgency=high" = {
      default-timeout = 0;
    };
  };
}
