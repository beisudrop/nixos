{
  flake.modules.homeManager.reaper =
    {
      pkgs,
      config,
      ...
    }:
    {
      home.file.".config/pipewire/jack.conf.d/10-reaper.conf".text = ''
        jack.rules = [
            {
                matches = [
                    { client.name = "REAPER" }
                ]
                actions = {
                    update-props = {
                        node.latency = 256/48000
                    }
                }
            }
        ]'';
      home.packages = with pkgs; [
        reaper
        yabridge
        yabridgectl
        wineWow64Packages.stable
      ];
      home.file = {
        ".config/yabridgectl/config.toml".text = ''
          plugin_dirs = ['${config.home.homeDirectory}/.wine/drive_c/Program Files/Common Files/VST3']
          vst2_location = 'centralized'
          no_verify = false
          blacklist = []
        '';
      };
    };
}
