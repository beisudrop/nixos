{
  flake.modules.nixos.jellyfin =
    { user, ... }:
    {
      services.jellyfin = {
        enable = true;
        openFirewall = true;
      };
      systemd.tmpfiles.rules = [
        "a+ /home/tobias - - - - u:jellyfin:x,m:x"
        "a+ /home/tobias/shows - - - - u:jellyfin:rx,m:rx,d:u:jellyfin:rx,d:m:rx"
        "a+ /home/tobias/movies - - - - u:jellyfin:rx,m:rx,d:u:jellyfin:rx,d:m:rx"
      ];
    };
}
