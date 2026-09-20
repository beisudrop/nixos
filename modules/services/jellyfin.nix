{
  flake.modules.nixos.jellyfin =
    { user, ... }:
    {
      services.jellyfin = {
        enable = true;
        openFirewall = true;
      };
      systemd.tmpfiles.rules = [
        "a+ /home/tobias - - - - u:jellyfin:x,m::x"
        "a+ /home/tobias/shows - - - - u:jellyfin:rx,m::rx"
        "a+ /home/tobias/shows - - - - d:u:jellyfin:rx,d:m::rx"
        "a+ /home/tobias/movies - - - - u:jellyfin:rx,m::rx"
        "a+ /home/tobias/movies - - - - d:u:jellyfin:rx,d:m::rx"
      ];
    };
  #    systemd.services.set-jellyfin-acl = {
  #  description = "Set ACLs for jellyfin media access";
  #  wantedBy = [ "multi-user.target" ];
  #  after = [ "local-fs.target" ];
  #  serviceConfig = {
  #    Type = "oneshot";
  #    ExecStart = ''
  #      setfacl -m u:jellyfin:x /home/tobias
  #      setfacl -m u:jellyfin:rx,m::rx /home/tobias/shows
  #      setfacl -d -m u:jellyfin:rx,m::rx /home/tobias/shows
  #      setfacl -m u:jellyfin:rx,m::rx /home/tobias/movies
  #      setfacl -d -m u:jellyfin:rx,m::rx /home/tobias/movies
  #    '';
  #  };
  #};
}
