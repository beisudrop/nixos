{
  flake.modules.nixos.bluetooth =
    { lib, ... }:
    {
      hardware.bluetooth.enable = true;
      hardware.bluetooth.powerOnBoot = false;
      systemd.services.bluetooth.wantedBy = lib.mkForce [ ];
    };
}
