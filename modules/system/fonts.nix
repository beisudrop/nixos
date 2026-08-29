{
  flake.modules.nixos.fonts =
    { pkgs, ... }:
    {
      fonts.packages = with pkgs; [
        nerd-fonts.meslo-lg
        noto-fonts-cjk-serif
      ];
    };
}
