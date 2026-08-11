{ ... }:

let
  vars = import ./vars.nix;
in {
  home.username = "${vars.userName}";
  home.homeDirectory = "/home/${vars.userName}";
  home.stateVersion = "26.11";
  programs.home-manager.enable = true;
}
