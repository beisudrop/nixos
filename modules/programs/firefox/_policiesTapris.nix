{
  ExtensionSettings = {
    "*".installation_mode = "allowed";
    "uBlock0@raymondhill.net" = {
      default_area = "menupanel";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
      installation_mode = "force_installed";
      private_browsing = true;
    };
  };
  DisableTelemetry = true;
  DisableFirefoxStudies = true;
  DisablePocket = true;
  OverrideFirstRunPage = "";
  OverridePostUpdatePage = "";
  DontCheckDefaultBrowser = true;
  DisableSetDesktopBackground = true;
}
