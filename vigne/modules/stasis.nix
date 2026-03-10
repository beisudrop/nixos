{ pkgs, ... }:
{
  home.packages = with pkgs; [ stasis ];

  systemd.user.services."stasis-wayland-idle-manager" = {
    Unit = {
      Description = "Stasis Wayland Idle Manager";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
      ConditionEnvironment = "WAYLAND_DISPLAY";
    };
    
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.stasis}/bin/stasis";
      Restart = "on-failure";
    };
    
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
  
  home.file = {
    ".config/stasis/stasis.rune".text = ''
@author "author"
@description "description"

stasis:
  pre_suspend_command "swaylock"
  monitor_media true
  ignore_remote_media true 
  media_blacklist ["spotify"] 
  respect_idle_inhibitors true
  enable_dbus_inhubit true

  # Lock detection method: "process" (default) or "logind"
  # Use "logind" if your locker uses loginctl (e.g., quickshell)
  #lock_detection_type "process"
  
  # debounce: default is 0s; can be customized if needed
  #debounce-seconds 4

  # enable notifications when Stasis unpauses from 
  # `stasis pause for <DURATION>`
  #  or
  #  `stasis pause until <TIME>`
  # run stasis pause help for more information
  #notify_on_unpause true

  #notify-before-command true
  #notify-seconds-before 10

  inhibit_apps [
    "mpv"
    r"steam_app_.*"
    "reaper"
  ]
  
  lock_screen:
    timeout 300
    command "swaylock"
  end
  
  dpms:
    timeout 60 # 1 minute(s) after lock
    command "niri msg action power-off-monitors"
    resume-command "niri msg action power-on-monitors"
  end
  
  suspend:
    timeout 1800 # 30 minute(s) after dpms
    command "systemctl suspend"
  end
end
    '';
  };
}



