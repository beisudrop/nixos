{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    plugins = {
      mount = pkgs.yaziPlugins.mount;
    };
    settings = {
      opener.audio = [
        { run = "mpv $@ --no-video"; }
      ];
      open.prepend_rules = [
        { name = "*.ogg"; use = "audio"; }
      ];
    };
  };
}
