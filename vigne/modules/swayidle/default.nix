{ pkgs, ... }:
{
  services.swayidle = {
    enable = true;

    # Use an attrset instead of a list
    events = {
      "before-sleep" = "${pkgs.swaylock}/bin/swaylock -fF";
      # "lock" = "lock";
    };

    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.swaylock}/bin/swaylock -fF";
      }
      {
        timeout = 900;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };
}
