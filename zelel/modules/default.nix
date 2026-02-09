{ ... }:

{
  home = {
    username = "beisu";
    homeDirectory = "/home/beisu";
    stateVersion = "25.11";
  };

  imports = [
    ./alacritty.nix
    ./dunst.nix
    ./fastfetch.nix
    ./fcitx5
    ./firefox.nix
    ./gtk.nix
#    ./hellwal
    ./kdeconnect.nix
    ./lutris.nix
    ./picom
    ./qtile
    ./rofi
    ./vesktop.nix
    ./yazi.nix
    ./zsh
  ];
}
