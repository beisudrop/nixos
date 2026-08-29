{
  flake.modules.nixos.ovpn =
    { pkgs, ... }:
    {
      networking.networkmanager.plugins = [ pkgs.networkmanager-openvpn ];
      networking.networkmanager.connectionConfig = {
        "ipv6.method" = "disabled";
      };
    };
}
