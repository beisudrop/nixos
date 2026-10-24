{
  flake.modules.homeManager.xdg-mime = {
    xdg.desktopEntries.yazi-dir = {
      name = "Yazi";
      comment = "Open directory in Yazi";
      exec = "kitty yazi %U"; # ← your terminal + yazi
      icon = "yazi";
      type = "Application";
      categories = [
        "FileManager"
        "Utility"
      ];
      mimeType = [ "inode/directory" ];
      # Terminal=false is the default, so no need to set it
    };

    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = [ "yazi-dir.desktop" ];
      };
    };
  };
}
