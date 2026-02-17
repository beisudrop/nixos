{ pkgs, } :

{
  programs.vscode = {
    enable = true;
    package = "vscode-fhs";
    profiles.default.extensions = with pkgs.vscode-extensions; [ illixion.vscode-vibrancy-continued ];
  };
}
