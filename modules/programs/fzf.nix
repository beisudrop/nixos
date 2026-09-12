{
  flake.modules.homeManager.fzf =
    {
      pkgs,
      ...
    }:
    {
      programs.fzf = {
        enable = true;
        defaultCommand = "fd";
        changeDirWidget.command = "fd --type d";
        changeDirWidget.options = [
          "--preview 'tree -C {} | head -200'"
        ];
        fileWidget.command = "fd --type f";
        fileWidget.options = [
          "--preview 'head {}'"
        ];
      };
      home.packages = with pkgs; [ fd ];
    };
}
