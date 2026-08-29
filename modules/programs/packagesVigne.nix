{
  flake.modules.homeManager.packagesVigne =
    {
      pkgs,
      ...
    }:
    {
      home.packages = with pkgs; [
        #blueman
        azahar
        bluez
        curl
        dolphin-emu
        eza # ls
        fd # find
        ffmpeg
        fzf # fuzzy
        heroic
        imagemagick
        jellyfin
        jq # json processor
        legcord
        localsend
        lua-language-server
        melonds
        mpv
        nil # nix language server
        nixfmt # nix formatter
        onlyoffice-desktopeditors
        opencode
        osu-lazer-bin
        perl # für spotx
        pince
        poppler # pdf rendering
        pwvucontrol # pipewire volume
        python3
        python314Packages.pynvim
        quickshell
        qt6Packages.qt6ct # qt control center
        resvg # svg support
        ripgrep # grep
        sabnzbd # nzb download
        setxkbmap # x11 us de swap for 東方11
        sshfs # mount filesystem
        tesseract # ocr
        timg # terminal images
        unrar
        unzip
        vscode-fhs
        wget
        winetricks
        xz # compression
        yt-dlp
        zoxide # cd
        # Niri
        # xwayland-satellite
        wl-clipboard
        # Hyprland
        grim
        slurp
      ];
    };
}
