{
  flake.modules.homeManager.packagesRaphiel =
    {
      pkgs,
      ...
    }:
    {
      home.packages = with pkgs; [
        python3
        ripgrep
        curl
        eza
        fd
        ffmpeg
        imagemagick
        unrar
        unzip
        wget
        xz
        zoxide
        btop
        fzf
        fastfetch
      ];
    };
}
