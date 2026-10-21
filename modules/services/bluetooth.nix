{
  flake.modules.nixos.bluetooth =
    { lib, ... }:
    {
      hardware.bluetooth.enable = true;
      hardware.bluetooth.powerOnBoot = false;
      hardware.bluetooth.input.General.ClassicBondedOnly = false;
      systemd.services.bluetooth = {
        wantedBy = lib.mkForce [ ];
        aliases = lib.mkForce [ ];
      };
    };
}
