{
  flake.modules.nixos.jellyfin =
    { user, ... }:
    {
      services.jellyfin = {
        enable = true;
        openFirewall = true;
      };
      systemd.tmpfiles.rules = [
        "a+ /home/${user} - - - - u:jellyfin:x"
        "a+ /home/${user}/shows - - - - u:jellyfin:rx"
        "a+ /home/${user}/shows - - - - d:u:jellyfin:rx"
        "a+ /home/${user}/movies - - - - u:jellyfin:rx"
        "a+ /home/${user}/movies - - - - d:u:jellyfin:rx"
      ];
    };
}
