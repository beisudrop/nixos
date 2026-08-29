{
  flake.modules.homeManager.zsh =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    {
      programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        oh-my-zsh.enable = true;
      };
      home.packages = [ pkgs.zsh-powerlevel10k ];
      programs.zsh.initContent =
        let
          zshEins = lib.mkOrder 1000 ''
            source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
                 [[ ! -f ${./p10k.zsh} ]] || source ${./p10k.zsh}
          '';
          zshZwei = lib.mkOrder 1200 ''

          '';
        in
        lib.mkMerge [
          zshEins
          zshZwei
        ];
    };

  flake.modules.homeManager.zshVigne =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    {
      programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        oh-my-zsh.enable = true;
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
          ls = "eza -a --icons";
          tree = "eza --tree --icons";
          update = ''cd /home/tobias/nixos && nix flake update && git add . && sudo nixos-rebuild switch --flake && git commit -m "flake update" && git push origin main'';
        };
      };
      home.packages = [ pkgs.zsh-powerlevel10k ];
      programs.zsh.initContent =
        let
          zshEins = lib.mkOrder 1000 ''
            source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
                 [[ ! -f ${./p10k.zsh} ]] || source ${./p10k.zsh}
          '';
          zshZwei = lib.mkOrder 1200 ''
            if [[ "$TERM" == "xterm-kitty" ]]; then
                 timg -g 40x40 -p kitty "$(find ~/Bilder/Pokemon -type f \( -name "*.png" -o -name "*.jpg" \) | shuf -n 1)"   
                 fi
          '';
          zshDrei = lib.mkOrder 1400 ''
            eval "$(zoxide init zsh)"
          '';
        in
        lib.mkMerge [
          zshEins
          zshZwei
          zshDrei
        ];
    };

}
