{ config, pkgs, ... }: {
  services.mako.enable = true;
  services.mako.settings = {
    include = "${config.home.homeDirectory}/.cache/hellwal/mako-colors";   
    default-timeout = 15000;
  };
}
