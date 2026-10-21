{
  flake.modules.nixos.bluetooth =
    { ... }:
    {
      hardware.bluetooth.enable = true;
      systemd.services.bluetooth.enable = false;
    };
}
