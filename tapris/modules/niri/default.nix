{ config, pkgs, lib, ... }: 
let
  vars = import ../../vars.nix;
in {
  home.file.".config/niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/${vars.hostName}/modules/niri/config.kdl";
}   
