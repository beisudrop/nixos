final: prev:
let
  spotx = prev.fetchurl {
    url = "https://github.com/SpotX-Official/SpotX-Bash/raw/5e9b08f91e55c210bbc64715b4ad698186b3c06b/spotx.sh";
#							    a2bd8479a2a80a068e749530aa5a78b2918358b8
    hash = "sha256-mlUc62b7Mw+Rpuiy0kqov5JCfrvKqgHLYfTf221gerM=";
  };
in
{
  spotify = prev.spotify.overrideAttrs (old: {
    nativeBuildInputs =
      old.nativeBuildInputs
      ++ (with prev; [
        util-linux
        perl
        unzip
        zip
        curl
      ]);

    unpackPhase =
      builtins.replaceStrings
        [ "runHook postUnpack" ]
        [
          ''
            patchShebangs --build ${spotx}
            runHook postUnpack
          ''
        ]
        old.unpackPhase;

    installPhase =
      builtins.replaceStrings
        [ "runHook postInstall" ]
        [
          ''
            bash ${spotx} -f -P "$out/share/spotify"
            runHook postInstall
          ''
        ]
        old.installPhase;
  });
}
