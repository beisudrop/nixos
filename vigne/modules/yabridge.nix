{ ... }:

let
  vars = import ../../vars.nix;
in
{
  home.file = {
    ".config/yabridgectl/config.toml".text = ''
      plugin_dirs = ['/home/${vars.userName}/.win-vst']
      vst2_location = 'centralized'
      no_verify = false
      blacklist = []
    '';
  };
}

