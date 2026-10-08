{
  flake.modules.nixos.jellyfin =
    { user, ... }:
    {
      services.jellyfin = {
        enable = true;
        openFirewall = true;
      };
      systemd.tmpfiles.rules = [
        "a+ /home/${user} - - - - u:jellyfin:x,m::x"
        "a+ /home/${user}/shows - - - - u:jellyfin:rx,m::rx"
        "a+ /home/${user}/shows - - - - d:u:jellyfin:rx,d:m::rx"
        "a+ /home/${user}/movies - - - - u:jellyfin:rx,m::rx"
        "a+ /home/${user}/movies - - - - d:u:jellyfin:rx,d:m::rx"
      ];
    };
  #    systemd.services.set-jellyfin-acl = {
  #  description = "Set ACLs for jellyfin media access";
  #  wantedBy = [ "multi-user.target" ];
  #  after = [ "local-fs.target" ];
  #  serviceConfig = {
  #    Type = "oneshot";
  #    ExecStart = ''
  #      setfacl -m u:jellyfin:x /home/${user}
  #      setfacl -m u:jellyfin:rx,m::rx /home/${user}/shows
  #      setfacl -d -m u:jellyfin:rx,m::rx /home/${user}/shows
  #      setfacl -m u:jellyfin:rx,m::rx /home/${user}/movies
  #      setfacl -d -m u:jellyfin:rx,m::rx /home/${user}/movies
  #    '';
  #  };
  #};
}
