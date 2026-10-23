{
  flake.modules.nixos.wiimote = {
    services.udev.extraHwdb = ''
      evdev:input:b0005v057Ep0306e*
        ID_INPUT_JOYSTICK=1
    '';
  };
}
