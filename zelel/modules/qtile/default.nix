{ config, ... }:

let vars = import ../../vars.nix; in

{
#  home.file.".config/qtile/config.py".source = ./config.py;
  xdg.configFile."qtile/config.py".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/${vars.hostName}/modules/qtile/config.py";
}
