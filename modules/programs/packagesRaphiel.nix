{
  flake.modules.homeManager.packagesRaphiel =
    {
      pkgs,
      ...
    }:
    {
      home.packages = with pkgs; [
        python3
        handbrake
        makemkv
        cyanrip
        ripgrep
        curl
        eza
        ffmpeg
        imagemagick
        unrar
        unzip
        wget
        xz
        zoxide
        btop
        fastfetch
      ];
    };
}
