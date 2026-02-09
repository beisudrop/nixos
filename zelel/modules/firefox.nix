{ ... }:

{
  programs.firefox = {
    enable = true;

    policies = {
      ExtensionSettings = {
#        "*".installation_mode = "blocked";
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
      };

      # SECTION: FASTFOX
      Preferences = {
        # GENERAL
        "gfx.content.skia-font-cache-size" = 32;

        # GFX
        "gfx.canvas.accelerated.cache-items" = 32768;
        "gfx.canvas.accelerated.cache-size" = 4096;
        "webgl.max-size" = 16384;

        # DISK CACHE
        "browser.cache.disk.enable" = false;

        # MEMORY CACHE
        "browser.cache.memory.capacity" = 262144;
        "browser.cache.memory.max_entry_size" = 32768;
        "browser.sessionhistory.max_total_viewers" = 4;
        "browser.sessionstore.max_tabs_undo" = 10;

        # MEDIA CACHE
        "media.memory_cache_max_size" = 262144;
        "media.memory_caches_combined_limit_kb" = 1048576;
        "media.cache_readahead_limit" = 600;
        "media.cache_resume_threshold" = 300;

        # IMAGE CACHE
        "image.cache.size" = 10485760;
        "image.mem.decode_bytes_at_a_time" = 65536;

        # NETWORK
        "network.http.max-connections" = 1800;
        "network.http.max-persistent-connections-per-server" = 10;
        "network.http.max-urgent-start-excessive-connections-per-host" = 5;
        "network.http.request.max-start-delay" = 5;
        "network.http.pacing.requests.enabled" = false;
        "network.dnsCacheEntries" = 10000;
        "network.dnsCacheExpiration" = 3600;
        "network.ssl_tokens_cache_capacity" = 10240;

        # SPECULATIVE LOADING
        "network.http.speculative-parallel-limit" = 0;
        "network.dns.disablePrefetch" = true;
        "network.dns.disablePrefetchFromHTTPS" = true;
        "browser.urlbar.speculativeConnect.enabled" = false;
        "browser.places.speculativeConnect.enabled" = false;
        "network.prefetch-next" = false;
        "network.predictor.enabled" = false;

        # SECTION: SECUREFOX

        # TRACKING PROTECTION
        "browser.contentblocking.category" = "strict";
        "privacy.trackingprotection.allow_list.baseline.enabled" = true;
        "browser.download.start_downloads_in_tmp_dir" = true;
        "browser.helperApps.deleteTempFileOnExit" = true;
        "browser.uitour.enabled" = false;
        "privacy.globalprivacycontrol.enabled" = true;

        # OCSP & CERTS / HPKP
        "security.OCSP.enabled" = 0;
        "security.csp.reporting.enabled" = false;

        # SSL / TLS
        "security.ssl.treat_unsafe_negotiation_as_broken" = true;
        "browser.xul.error_pages.expert_bad_cert" = true;
        "security.tls.enable_0rtt_data" = false;

        # DISK AVOIDANCE
        "browser.privatebrowsing.forceMediaMemoryCache" = true;
        "browser.sessionstore.interval" = 60000;

        # SHUTDOWN & SANITIZING
        "privacy.history.custom" = true;
        "browser.privatebrowsing.resetPBM.enabled" = true;

        # SEARCH / URL BAR
        "browser.urlbar.trimHttps" = true;
        "browser.urlbar.untrimOnUserInteraction.featureGate" = true;
        "browser.search.separatePrivateDefault.ui.enabled" = true;
        "browser.search.suggest.enabled" = false;
        "browser.urlbar.quicksuggest.enabled" = false;
        "browser.urlbar.groupLabels.enabled" = false;
        "browser.formfill.enable" = false;
        "network.IDN_show_punycode" = true;

        # PASSWORDS
        "signon.formlessCapture.enabled" = false;
        "signon.privateBrowsingCapture.enabled" = false;
        "network.auth.subresource-http-auth-allow" = 1;
        "editor.truncate_user_pastes" = false;

        # MIXED CONTENT + CROSS-SITE
        "security.mixed_content.block_display_content" = true;
        "pdfjs.enableScripting" = false;

        # EXTENSIONS
        "extensions.enabledScopes" = 5;

        # HEADERS / REFERERS
        "network.http.referer.XOriginTrimmingPolicy" = 2;

        # CONTAINERS
        "privacy.userContext.ui.enabled" = true;

        # SAFE BROWSING
        "browser.safebrowsing.downloads.remote.enabled" = false;

        # MOZILLA
        "permissions.default.desktop-notification" = 2;
        "permissions.default.geo" = 2;
        "geo.provider.network.url" = "https://beacondb.net/v1/geolocate";
        "browser.search.update" = false;
        "permissions.manager.defaultsUrl" = "";
        "extensions.getAddons.cache.enabled" = false;

        # TELEMETRY
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.server" = "data:,";
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = true;
        "toolkit.coverage.opt-out" = true;
        "toolkit.coverage.endpoint.base" = "";
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "datareporting.usage.uploadEnabled" = false;

        # EXPERIMENTS
        "app.shield.optoutstudies.enabled" = false;
        "app.normandy.enabled" = false;
        "app.normandy.api_url" = "";

        # CRASH REPORTS
        "breakpad.reportURL" = "";
        "browser.tabs.crashReporting.sendReport" = false;

        # SECTION: PESKYFOX
        # MOZILLA UI
        "browser.privatebrowsing.vpnpromourl" = "";
        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "browser.discovery.enabled" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
        "browser.preferences.moreFromMozilla" = false;
        "browser.aboutConfig.showWarning" = false;
        "browser.aboutwelcome.enabled" = false;
        "browser.profiles.enabled" = true;

        # THEME ADJUSTMENTS
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.compactmode.show" = true;
        "browser.privateWindowSeparation.enabled" = false;

        # AI
        "browser.ml.enable" = false;
        "browser.ml.chat.enabled" = false;
        "browser.ml.chat.menu" = false;
        "browser.tabs.groups.smart.enabled" = false;
        "browser.ml.linkPreview.enabled" = false;

        # FULLSCREEN NOTICE
        "full-screen-api.transition-duration.enter" = "0 0";
        "full-screen-api.transition-duration.leave" = "0 0";
        "full-screen-api.warning.timeout" = 0;

        # URL BAR
        "browser.urlbar.trending.featureGate" = false;

        # NEW TAB PAGE
        "browser.newtabpage.activity-stream.default.sites" = "";
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
        "browser.newtabpage.pinned" = "";

        # DOWNLOADS
        "browser.download.manager.addToRecentDocs" = false;

        # PDF
        "browser.download.open_pdf_attachments_inline" = true;

        # TAB BEHAVIOR
        "browser.bookmarks.openInTabClosesMenu" = false;
        "browser.menu.showViewImageInfo" = true;
        "findbar.highlightAll" = true;
        "layout.word_select.eat_space_to_next_word" = false;
      };

      # Additional policies for settings that work better as dedicated policy options
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
#      DisplayMenuBar = "default-on";
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
    profiles.beisu.userChrome = "
/* Remove window controls */
.titlebar-buttonbox-container {
    display: none !important;
}

/* Hide navigarion bar */
#toolbar-menubar { display: none !important; }

/* Center url bar text when not focused */
urlbar:not([focused]) .urlbar-input {
    text-align: center !important;
}

/* Url bar rounding */
#urlbar-background,
#searchbar {
    border-radius: 10px !important;
}

/* Url bar buttons */
.urlbar-page-action,
#urlbar-go-button,
.search-go-button,
#tracking-protection-icon-container,
#identity-icon-box,
#identity-permission-box,
.notification-anchor-icon,
#userContext-icons,
#urlbar-zoom-button,
#page-action-buttons,
.search-one-offs,
#urlbar-search-mode-indicator {
    border-radius: 10px !important;
}

/* Keep url bar in place when expanding */
#urlbar[breakout][breakout-extend] {
    margin-top: 5px !important;
    margin-left: 0 !important;
    width: var(--urlbar-width) !important;
}

    ";
#    profiles.beisu.userContent = ''
#    '';
  };
}
