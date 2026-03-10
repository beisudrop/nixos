{ pkgs-stable, ... }:

let
  vars = import ../../vars.nix;
in
{
  home.packages = [
    pkgs-stable.yabridge
    pkgs-stable.wineWowPackages.yabridge
    pkgs-stable.yabridgectl
    ];

  home.file = {
    ".config/yabridgectl/config.toml".text = ''
      plugin_dirs = ['/home/${vars.userName}/.wine/drive_c/Program Files/Common Files/VST3']
      vst2_location = 'centralized'
      no_verify = false
      blacklist = []
    '';
  };
}

