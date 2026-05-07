{ ... }:

{
  services.network-manager-applet.enable = true;
  programs.fastfetch.enable = true;
  programs.btop.enable = true;
  programs.waybar.enable = true;
  services.swww.enable = true;
  # services.cliphist.enable = true;

  imports = [
    ./home.nix
    ./firefox
    ./fuzzel.nix
    ./zsh
    ./gtk.nix
    #./hellwal
    ./mako.nix
    ./neovim
    #./niri hellwal and niri have out of store symlinks so importing from git doesnt work
    ./kitty.nix
    ./alacritty.nix
    ./rofi
    ./yazi.nix
  ];
}
