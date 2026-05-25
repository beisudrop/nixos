{ config, ... }: 
let
  vars = import ../../vars.nix;
in {
  home.file.".config/hypr/hyprland.lua".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/${vars.hostName}/modules/hypr/hyprland.lua";
}   
