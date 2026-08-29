//
/* You may copy+paste this file and use it as it is.
 *
 * If you make changes to your about:config while the program is running, the
 * changes will be overwritten by the user.js when the application restarts.
 *
 * To make lasting changes to preferences, you will have to edit the user.js.
 */

/****************************************************************************
 * Betterfox                                                                *
 * "Ad meliora"                                                             *
 * version: 152                                                             *
 * url: https://github.com/yokoffing/Betterfox                              *
****************************************************************************/

/****************************************************************************
 * SECTION: FASTFOX                                                         *
****************************************************************************/
/** GENERAL ***/
locked_pref("gfx.content.skia-font-cache-size", 20);
locked_pref("content.notify.interval", 100000);

/** GFX ***/
locked_pref("gfx.canvas.accelerated.cache-size", 512);

/** JS ***/
locked_pref("javascript.options.baselinejit.threshold", 50);

/** MEDIA CACHE ***/
locked_pref("media.cache_readahead_limit", 3600);
locked_pref("media.cache_resume_threshold", 1800);

/** IMAGE CACHE ***/
locked_pref("image.mem.decode_bytes_at_a_time", 32768);

/** NETWORKING ***/
locked_pref("network.buffer.cache.size", 65535);
locked_pref("network.buffer.cache.count", 48);
locked_pref("network.http.max-connections", 1800);
locked_pref("network.http.max-persistent-connections-per-server", 10);
locked_pref("network.http.max-urgent-start-excessive-connections-per-host", 5);
locked_pref("network.http.request.max-start-delay", 5);
locked_pref("network.dnsCacheExpiration", 3600);

/****************************************************************************
 * SECTION: SECUREFOX                                                       *
****************************************************************************/
/** TRACKING PROTECTION ***/
locked_pref("browser.contentblocking.category", "strict");
locked_pref("browser.download.start_downloads_in_tmp_dir", true);
locked_pref("browser.uitour.enabled", false);
locked_pref("privacy.globalprivacycontrol.enabled", true);

/** OCSP & CERTS / HPKP ***/
locked_pref("security.OCSP.enabled", 0);
locked_pref("privacy.antitracking.isolateContentScriptResources", true);
locked_pref("security.csp.reporting.enabled", false);

/** SSL / TLS ***/
locked_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
locked_pref("browser.xul.error_pages.expert_bad_cert", true);
locked_pref("security.tls.enable_0rtt_data", false);

/** DISK AVOIDANCE ***/
locked_pref("browser.cache.disk.enable", false);
locked_pref("browser.privatebrowsing.forceMediaMemoryCache", true);
locked_pref("media.memory_cache_max_size", 65536);
locked_pref("browser.sessionstore.interval", 60000);

/** SHUTDOWN & SANITIZING ***/
locked_pref("privacy.history.custom", true);

/** SPECULATIVE LOADING ***/
locked_pref("network.http.speculative-parallel-limit", 0);
locked_pref("network.dns.disablePrefetch", true);
locked_pref("network.dns.disablePrefetchFromHTTPS", true);
locked_pref("browser.urlbar.speculativeConnect.enabled", false);
locked_pref("browser.places.speculativeConnect.enabled", false);
locked_pref("network.prefetch-next", false);

/** SEARCH / URL BAR ***/
locked_pref("browser.urlbar.trimHttps", true);
locked_pref("browser.urlbar.untrimOnUserInteraction.featureGate", true);
locked_pref("browser.search.separatePrivateDefault.ui.enabled", true);
locked_pref("browser.search.suggest.enabled", false);
locked_pref("browser.urlbar.quicksuggest.enabled", false);
locked_pref("browser.urlbar.groupLabels.enabled", false);
locked_pref("browser.formfill.enable", false);
locked_pref("network.IDN_show_punycode", true);

/** HTTPS-ONLY MODE ***/
locked_pref("dom.security.https_only_mode", true);
locked_pref("dom.security.https_only_mode_error_page_user_suggestions", true);

/** PASSWORDS ***/
locked_pref("signon.formlessCapture.enabled", false);
locked_pref("signon.privateBrowsingCapture.enabled", false);
locked_pref("network.auth.subresource-http-auth-allow", 1);
locked_pref("editor.truncate_user_pastes", false);

/** EXTENSIONS ***/
locked_pref("extensions.enabledScopes", 5);

/** HEADERS / REFERERS ***/
locked_pref("network.http.referer.XOriginTrimmingPolicy", 2);

/** CONTAINERS ***/
locked_pref("privacy.userContext.ui.enabled", true);

/** VARIOUS ***/
locked_pref("pdfjs.enableScripting", false);

/** SAFE BROWSING ***/
locked_pref("browser.safebrowsing.downloads.remote.enabled", false);

/** MOZILLA ***/
locked_pref("permissions.default.desktop-notification", 2);
locked_pref("permissions.default.geo", 2);
locked_pref("geo.provider.network.url", "https://beacondb.net/v1/geolocate");
locked_pref("browser.search.update", false);
locked_pref("permissions.manager.defaultsUrl", "");
locked_pref("extensions.getAddons.cache.enabled", false);

/** TELEMETRY ***/
locked_pref("datareporting.policy.dataSubmissionEnabled", false);
locked_pref("datareporting.healthreport.uploadEnabled", false);
locked_pref("toolkit.telemetry.unified", false);
locked_pref("toolkit.telemetry.enabled", false);
locked_pref("toolkit.telemetry.server", "data:,");
locked_pref("toolkit.telemetry.archive.enabled", false);
locked_pref("toolkit.telemetry.newProfilePing.enabled", false);
locked_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
locked_pref("toolkit.telemetry.updatePing.enabled", false);
locked_pref("toolkit.telemetry.bhrPing.enabled", false);
locked_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
locked_pref("toolkit.telemetry.coverage.opt-out", true);
locked_pref("toolkit.coverage.opt-out", true);
locked_pref("toolkit.coverage.endpoint.base", "");
locked_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
locked_pref("browser.newtabpage.activity-stream.telemetry", false);
locked_pref("datareporting.usage.uploadEnabled", false);

/** EXPERIMENTS ***/
locked_pref("app.shield.optoutstudies.enabled", false);
locked_pref("app.normandy.enabled", false);
locked_pref("app.normandy.api_url", "");

/** CRASH REPORTS ***/
locked_pref("breakpad.reportURL", "");
locked_pref("browser.tabs.crashReporting.sendReport", false);

/****************************************************************************
 * SECTION: PESKYFOX                                                        *
****************************************************************************/
/** MOZILLA UI ***/
locked_pref("extensions.getAddons.showPane", false);
locked_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
locked_pref("browser.discovery.enabled", false);
locked_pref("browser.shell.checkDefaultBrowser", false);
locked_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
locked_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);
locked_pref("browser.preferences.moreFromMozilla", false);
locked_pref("browser.aboutConfig.showWarning", false);
locked_pref("browser.startup.homepage_override.mstone", "ignore");
locked_pref("browser.aboutwelcome.enabled", false);
locked_pref("browser.profiles.enabled", true);

/** THEME ADJUSTMENTS ***/
locked_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
locked_pref("browser.compactmode.show", true);
locked_pref("browser.privateWindowSeparation.enabled", false); // WINDOWS

/** AI ***/
locked_pref("browser.ai.control.default", "blocked");
locked_pref("browser.ml.enable", false);
locked_pref("browser.ml.chat.enabled", false);
locked_pref("browser.ml.chat.menu", false);
locked_pref("browser.tabs.groups.smart.enabled", false);
locked_pref("browser.ml.linkPreview.enabled", false);

/** FULLSCREEN NOTICE ***/
locked_pref("full-screen-api.transition-duration.enter", "0 0");
locked_pref("full-screen-api.transition-duration.leave", "0 0");
locked_pref("full-screen-api.warning.timeout", 0);

/** URL BAR ***/
locked_pref("browser.urlbar.trending.featureGate", false);

/** NEW TAB PAGE ***/
locked_pref("browser.newtabpage.activity-stream.default.sites", "");
locked_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
locked_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
locked_pref("browser.newtabpage.activity-stream.showSponsored", false);
locked_pref("browser.newtabpage.activity-stream.showSponsoredCheckboxes", false);

/** DOWNLOADS ***/
locked_pref("browser.download.manager.addToRecentDocs", false);

/** PDF ***/
locked_pref("browser.download.open_pdf_attachments_inline", true);

/** TAB BEHAVIOR ***/
locked_pref("browser.bookmarks.openInTabClosesMenu", false);
locked_pref("findbar.highlightAll", true);

/****************************************************************************
 * SECTION: SMOOTHFOX                                                       *
****************************************************************************/
// visit https://github.com/yokoffing/Betterfox/blob/main/Smoothfox.js
// Enter your scrolling overrides below this line:


/****************************************************************************
 * START: MY OVERRIDES                                                      *
****************************************************************************/
// PREF: disable login manager
locked_pref("signon.rememberSignons", false);

// PREF: disable address and credit card manager
locked_pref("extensions.formautofill.addresses.enabled", false);
locked_pref("extensions.formautofill.creditCards.enabled", false);

// PREF: disable passkeys
locked_pref("security.webauth.webauthn", false);
// PREF: set DoH provider
locked_pref("network.trr.uri", "https://dns.dnswarden.com/00000000000000000000028"); // Hagezi Normal + TIF
// PREF: enforce DNS-over-HTTPS (DoH)
locked_pref("network.trr.mode", 2);
locked_pref("network.trr.max-fails", 5);
// PREF: enforce certificate pinning
// [ERROR] MOZILLA_PKIX_ERROR_KEY_PINNING_FAILURE
// 1 = allow user MiTM (such as your antivirus) (default)
// 2 = strict
locked_pref("security.cert_pinning.enforcement_level", 2);
// PREF: delete all browsing data on shutdown
locked_pref("privacy.sanitize.sanitizeOnShutdown", true);
locked_pref("privacy.clearOnShutdown_v2.cache", true);
locked_pref("privacy.clearOnShutdown_v2.cookiesAndStorage", true);
locked_pref("privacy.clearOnShutdown_v2.browsingHistoryAndDownloads", true);
locked_pref("privacy.clearOnShutdown_v2.downloads", true); // [HIDDEN]
locked_pref("privacy.clearOnShutdown_v2.formdata", true);

// PREF: after crashes or restarts, do not save extra session data
// such as form content, scrollbar positions, and POST data
locked_pref("browser.sessionstore.privacy_level", 2);

// PREF: disable captive portal detection
// [WARNING] Do NOT use for mobile devices!
locked_pref("captivedetect.canonicalURL", ""); 
locked_pref("network.captive-portal-service.enabled", false); 
locked_pref("network.connectivity-service.enabled", false);


/****************************************************************************
 * END: BETTERFOX                                                           *
****************************************************************************/
