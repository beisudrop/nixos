{ pkgs, ... }: {

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    plugins = with pkgs.vimPlugins; [
      transparent-nvim
      nvim-treesitter
      telescope-nvim
      yazi-nvim
      nvim-lspconfig
      nvim-cmp
    ];
    extraConfig = ''
      set clipboard+=unnamedplus 
    '';
    initLua = ''
      vim.lsp.enable('nil_ls')
    '';
    coc = {
      enable = false;
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
