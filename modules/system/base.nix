{
  inputs,
  self,
  ...
}:
{
  flake.modules.nixos.base =
    {
      pkgs,
      lib,
      host,
      ...
    }:
    {
      imports = [ self.modules.nixos.home-manager ];
      nixpkgs.config.allowUnfree = true;
      networking.networkmanager.enable = true;
      users.defaultUserShell = pkgs.zsh;
      programs.zsh.enable = lib.mkDefault true;
      security.sudo.wheelNeedsPassword = false;
      security.polkit.enable = true;
      nix.channel.enable = false;
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      nix.optimise.automatic = true;
      nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
      i18n.defaultLocale = "de_DE.UTF-8";
      console = {
        font = "Lat2-Terminus16";
        useXkbConfig = true;
      };
      time.timeZone = "Europe/Berlin";
      zramSwap.enable = true; # Creates a zram block device and uses it as a swap device
      boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
      networking.hostName = "${host}";
    };
}
