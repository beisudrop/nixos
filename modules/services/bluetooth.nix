{
  flake.modules.nixos.bluetooth =
    { lib, ... }:
    {
      hardware.bluetooth.enable = true;
      hardware.bluetooth.powerOnBoot = false;
      hardware.bluetooth.input.General.ClassicBondedOnly = false; # for switch joycon
      systemd.services.bluetooth = {
        wantedBy = lib.mkForce [ ];
        #aliases = lib.mkForce [ ]; #disable on boot
      };
      services.udev.extraHwdb = ''
        evdev:input:b0005v057Ep0306e*
          ID_INPUT_JOYSTICK=1
      ''; # wiimote
    };
}
