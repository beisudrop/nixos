{
  flake.modules.nixos.lanzaboote =
    { lib, pkgs, ... }:
    {
      boot.loader.systemd-boot.enable = lib.mkForce false;
      boot.loader.systemd-boot.configurationLimit = 3;
      boot.loader.efi.canTouchEfiVariables = true;
      boot.lanzaboote.enable = true;
      boot.lanzaboote.pkiBundle = "/var/lib/sbctl";
      boot.lanzaboote.autoEnrollKeys = {
        enable = true;
      };
      environment.systemPackages = [
        pkgs.sbctl
      ];
    };
}
