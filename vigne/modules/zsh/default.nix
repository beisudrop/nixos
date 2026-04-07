{ pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    history = {
      save = 1000;
      size = 1000;
      path = "$HOME/.cache/zsh_history";
    };

    shellAliases = {
        c = "clear";
        mkdir = "mkdir -vp";
        mv = "mv -iv";
        cp = "cp -iv";
#       cat = "bat --paging=never --style=plain";
        ls = "eza -a --icons";
        tree = "eza --tree --icons";
        update = ''cd /home/tobias/nixos && nix flake update && git add . && sudo nixos-rebuild switch --flake && git commit -m "flake update" && git push origin main'';
    };

    oh-my-zsh = {
      enable = true;
    };

    initContent = 
    let
      zshEins = lib.mkOrder 1000 '' source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ ! -f ${./p10k.zsh} ]] || source ${./p10k.zsh}
      '';
      zshZwei = lib.mkOrder 1200 '' if [[ "$TERM" == "xterm-kitty" ]]; then
      kitty +kitten icat --align=left --use-window-size $COLUMNS,$LINES,400,400 "$(find ~/Bilder/Pokemon -type f -name "*.png" -o -name "*.jpg" | shuf -n 1)" 
      fi
      '';
    in
    lib.mkMerge [ zshEins zshZwei ];
  };
#  plugins = [
#    {
#      name = "powerlevel10k-config";
#      src = lib.cleanSource ./p10k-config;
#      file = "p10k.zsh";
#    }
#  ];

  home.packages = [ pkgs.zsh-powerlevel10k ];
#  home.file.".p10k.zsh".source = ./.p10k.zsh;
}
