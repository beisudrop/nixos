{
  flake.modules.nixos.bluetooth =
    { lib, ... }:
    {
      hardware.bluetooth.enable = true;
      hardware.bluetooth.powerOnBoot = false;
      hardware.bluetooth.settings = {
        General = {
          ClassicBondedOnly = false;
        };
      };
      systemd.services.bluetooth.wantedBy = lib.mkForce [ ];
    };
}
