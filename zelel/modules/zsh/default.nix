{ pkgs, ... }:

let vars = import ../../vars.nix; in

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
#        cat = "bat --paging=never --style=plain";
        ls = "exa -a --icons";
        tree = "exa --tree --icons";
        # nd = "nix develop -c $SHELL";
        # rebuild = "cd ${vars.pathToConfig} && sudo nixos-rebuild switch --flake";
        # update = "cd ${vars.pathToConfig} && sudo nix flake update && sudo nixos-rebuild switch --flake";
    };

    oh-my-zsh = {
      enable = true;
    };

    initContent = '' source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ ! -f ${./p10k.zsh} ]] || source ${./p10k.zsh}

      '';
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
