{pkgs, lib, config, inputs, ...}:

{
  programs.yazi.enable = true;
  services.network-manager-applet.enable = true;
  programs.fastfetch.enable = true;
  programs.btop.enable = true;
  programs.waybar.enable = true;
  services.dunst.enable = true;
  services.swww.enable = true;
  services.cliphist.enable = true;
  services.swayidle.enable = true;
  # services.sunshine.enable = true;

  imports = [ 
    ./home.nix
    ./firefox
    ./zsh
    ./gtk.nix
    ./kitty.nix
    ./alacritty.nix
    ./rofi
    ./yabridge.nix
  ];  
}
