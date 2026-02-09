{ pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    initContent = lib.mkOrder 1200 ''
      if [ -n "$SSH_CONNECTION" ]; then
        export WAYLAND_DISPLAY=wayland-1
        export HYPRLAND_INSTANCE_SIGNATURE=$(ls -1 /run/user/1000/hypr/ | head -n 1)
      fi
    '';
  };

  programs.bash.bashrcExtra = ''
    if [ -n "$SSH_CONNECTION" ]; then
      export WAYLAND_DISPLAY=wayland-1
      export HYPRLAND_INSTANCE_SIGNATURE=$(ls -1 /run/user/1000/hypr/ | head -n 1)
    fi
  '';
}
