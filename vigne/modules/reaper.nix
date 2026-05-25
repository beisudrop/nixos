{ ... }:


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
}
