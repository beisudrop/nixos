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
        "a+ /home/tobias/shows - - - - u:jellyfin:rx,m:rx"
        "a+ /home/tobias/shows - - - - d:u:jellyfin:rx,d:m:rx"
        "a+ /home/tobias/movies - - - - u:jellyfin:rx,m:rx"
        "a+ /home/tobias/movies - - - - d:u:jellyfin:rx,d:m:rx"
      ];
    };
}
