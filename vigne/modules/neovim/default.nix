{ pkgs, ... }: {

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    plugins = with pkgs.vimPlugins; [
      transparent-nvim
    ];
    coc = {
      enable = true;
      settings = {
        languageserver = {
          nix = {
            command = "nil";
            filetypes = [ "nix" ];
            rootPatterns =  [ "flake.nix" ];
            # settings = {
            #   nil = {
            #     formatting = { "command": ["nixfmt"] };
            #    };
            #  };
          };
        };
      };
    };
  };
}
