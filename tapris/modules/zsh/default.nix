{ pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      c = "clear";
      mkdir = "mkdir -vp";
      mv = "mv -iv";
      cp = "cp -iv";
      update = "sudo nixos-rebuild switch --flake github:beisudrop/nixos#tapris --recreate-lock-file --no-write-lock-file";
    };
    oh-my-zsh.enable = true;
    initContent = 
    let
      zshEins = lib.mkOrder 1000 '' source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ ! -f ${./p10k.zsh} ]] || source ${./p10k.zsh}
      '';
      zshZwei = lib.mkOrder 1200 ''
      
    '';
    in
    lib.mkMerge [ zshEins zshZwei ];
  };
  home.packages = [ pkgs.zsh-powerlevel10k ];

  programs.bash.bashrcExtra = ''
    if [ -n "$SSH_CONNECTION" ]; then
      export WAYLAND_DISPLAY=wayland-1
      export HYPRLAND_INSTANCE_SIGNATURE=$(ls -1 /run/user/1000/hypr/ | head -n 1)
    fi
  '';
}
