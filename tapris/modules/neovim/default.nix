{ pkgs, ... }:
{

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    plugins = with pkgs.vimPlugins; [
      transparent-nvim
    ];
    extraConfig = ''
      set clipboard+=unnamedplus 
    '';
    initLua = ''

    '';
  };
}
