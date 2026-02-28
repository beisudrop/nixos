{ config, pkgs, lib, ... }: 
let
  vars = import ../../vars.nix;
in {
  home.file.".config/hellwal/themes".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/${vars.hostName}/modules/hellwal/themes";
  home.file.".config/hellwal/templates".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/${vars.hostName}/modules/hellwal/templates";
}  
