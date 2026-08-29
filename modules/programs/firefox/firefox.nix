{
  self,
  lib,
  ...
}:
{
  flake.modules = lib.mkMerge [
    {
      homeManager.firefoxTapris =
        {
          ...
        }:
        {
          programs.firefox = {
            enable = true;
            policies = {
              ExtensionSettings = {
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
            };
            profiles.default = {
              # extraConfig = builtins.readFile ./user.js;
              userChrome = builtins.readFile ./_userChrome.css;
            };
          };
        };
    }
    {
      homeManager.firefoxVigne =
        {
          ...
        }:
        {
          programs.firefox = {
            enable = true;

            policies = {
              ExtensionSettings = {
                "uBlock0@raymondhill.net" = {
                  default_area = "menupanel";
                  install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
                  installation_mode = "force_installed";
                  private_browsing = true;
                };
                "{6b733b82-9261-47ee-a595-2dda294a4d08}" = {
                  default_area = "menupanel";
                  install_url = "https://addons.mozilla.org/firefox/downloads/latest/yomitan/latest.xpi";
                  installation_mode = "force_installed";
                  private_browsing = true;
                };
                "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
                  default_area = "menupanel";
                  install_url = "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
                  installation_mode = "force_installed";
                  private_browsing = true;
                };
                "idcac-pub@guus.ninja" = {
                  default_area = "menupanel";
                  install_url = "https://addons.mozilla.org/firefox/downloads/latest/istilldontcareaboutcookies/latest.xpi";
                  installation_mode = "force_installed";
                  private_browsing = true;
                };
                "myallychou@gmail.com" = {
                  default_area = "menupanel";
                  install_url = "https://addons.mozilla.org/firefox/downloads/latest/youtube-recommended-videos/latest.xpi";
                  installation_mode = "force_installed";
                  private_browsing = true;
                };
                "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
                  default_area = "menupanel";
                  install_url = "https://addons.mozilla.org/firefox/downloads/latest/return-youtube-dislikes/latest.xpi";
                  installation_mode = "force_installed";
                  private_browsing = true;
                };
                "{74145f27-f039-47ce-a470-a662b129930a}" = {
                  default_area = "menupanel";
                  install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
                  installation_mode = "force_installed";
                  private_browsing = true;
                };
                "jid1-MnnxcxisBPnSXQ@jetpack" = {
                  default_area = "menupanel";
                  install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger/latest.xpi";
                  installation_mode = "force_installed";
                  private_browsing = true;
                };
                "CanvasBlocker@kkapsner.de" = {
                  default_area = "menupanel";
                  install_url = "https://addons.mozilla.org/firefox/downloads/latest/canvasblocker/latest.xpi";
                  installation_mode = "force_installed";
                  private_browsing = true;
                };
                "ff2mpv@yossarian.net" = {
                  default_area = "menupanel";
                  install_url = "https://addons.mozilla.org/firefox/downloads/latest/ff2mpv/latest.xpi";
                  installation_mode = "force_installed";
                  private_browsing = true;
                };
                "sponsorBlocker@ajay.app" = {
                  default_area = "menupanel";
                  install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
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
              EnableTrackingProtection = true;
              TrackingProtectionMode = "strict";
              DisableTelephony = true;
              DisableFirefoxScreenshots = true;
              DisableFormHistory = true;
              NoDefaultBookmarks = true;
              SanitizeOnShutdown = {
                cache = true;
                cookies = true;
                downloads = true;
                formData = true;
                history = true;
                sessions = true;
              };
              #      DisableProfileRefresh = true;
              NetworkPrediction = false;
            };
            #    profiles.beisu.extraConfig = builtins.readFile ./user.js;
            #    profiles.beisu.userChrome = ''
            #    '';
            #    profiles.beisu.userContent = ''
            #    '';
          };
        };
    }
    {
      nixos.firefoxBase =
        { ... }:
        {
          programs.firefox = {
            enable = true;
            preferences = import ./_prefs.nix;
          };
        };
    }
    {
      nixos.firefoxTapris = { user, ... }: {
        imports = [ self.modules.nixos.firefoxBase ];
        home-manager.users."${user}".imports = [ self.modules.homeManager.firefoxTapris ];
      };
    }
    {
      nixos.firefoxVigne = { user, ... }: {
        imports = [ self.modules.nixos.firefoxBase ];
        home-manager.users."${user}".imports = [ self.modules.homeManager.firefoxVigne ];
      };
    }
  ];
}
