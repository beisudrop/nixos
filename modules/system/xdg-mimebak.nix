{
  flake.modules.nixos.xdg-mime = {
    xdg.mime = {
      enable = true;
      defaultApplications = {
        "inode/directory" = "yazi.desktop";
      };
    };
  };
}
