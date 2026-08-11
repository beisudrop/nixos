{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    plugins = with pkgs.vimPlugins; [
      telescope-nvim
      yazi-nvim
      smear-cursor-nvim
			gruvbox-material-nvim
			nvim-tree-lua
      lazy-nvim
    ];
  };
  home.file.".config/nvim".source = ./nvim;
  home.file.".config/nvim".recursive = true;
}
