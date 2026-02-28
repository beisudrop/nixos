{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    policies = {
      ExtensionSettings = {
        # "*".installation_mode = "blocked";
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
      DNSOverHTTPS = {
        enabled = true;
        providerURL = "https://dns.quad9.net/dns-query";
        locked = true;
        fallback = true;
      };
    };
    profiles.default = {
      extraConfig = builtins.readFile ./user.js;
      userChrome = builtins.readFile ./userChrome.css;
    };
  };
}
