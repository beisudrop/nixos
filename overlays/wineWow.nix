nixpkgs-2511: final: prev:
let
  pkgs2511 = import nixpkgs-2511 {
    stdenv.hostPlatform.system = final.stdenv.hostPlatform.system;
  };
in {
  wineWowPackages = pkgs2511;
  yabridge = pkgs2511.yabridge;
  yabridgectl = pkgs2511.yabridgectl;
}
