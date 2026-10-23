{
  flake.modules.nixos.wiimote = { pkgs, ... }: {
    boot.blacklistedKernelModules = [ "hid-wiimote" ];
    services.udev.packages = [
      (pkgs.writeTextFile {
        name = "wiimote-hidraw";
        destination = "/etc/udev/rules.d/60-wiimote-hidraw.rules";
        text = ''
          SUBSYSTEM=="hidraw", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="0306", MODE="0660", GROUP="input"
        '';
      })
    ];
  };
}
