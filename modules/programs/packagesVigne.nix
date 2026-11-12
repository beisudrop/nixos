{
  flake.modules.homeManager.packagesVigne =
    {
      pkgs,
      pkgs-pinned,
      ...
    }:
    let
      pinnedPkgs = import pkgs-pinned {
        inherit (pkgs) system;
        config.allowUnfree = true;
      };
    in
    {
      home.packages = with pkgs; [
        azahar
        curl
        dolphin-emu
        eden
        eza # ls
        ffmpeg
        heroic
        imagemagick
        feh
        jellyfin
        jq # json processor
        legcord
        localsend
        lua-language-server
        melonds
        moltengamepad
        mpv
        nil # nix language server
        nixfmt # nix formatter
        onlyoffice-desktopeditors
        pinnedPkgs.opencode
        osu-lazer-bin
        p7zip
        perl
        pince
        poppler # pdf rendering
        pwvucontrol # pipewire volume
        python3
        python314Packages.pynvim
        quickshell
        qt6Packages.qt6ct # qt control center
        resvg # svg support
        ripgrep # grep
        ryubing
        sabnzbd # nzb download
        setxkbmap # x11 us de swap for 東方11
        sshfs # mount filesystem
        tesseract # ocr
        timg # terminal images
        umbriel
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
