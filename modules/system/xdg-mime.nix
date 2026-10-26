{
  flake.modules.homeManager.xdg-mime = {
    xdg.desktopEntries.yazi-dir = {
      name = "Yazi";
      comment = "Open directory in Yazi";
      exec = "kitty yazi %U";
      icon = "yazi";
      type = "Application";
      categories = [
        "FileManager"
        "Utility"
      ];
      mimeType = [ "inode/directory" ];
    };

    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = [ "yazi-dir.desktop" ];
      };
    };
  };
}
