{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    pkgs-pinned.url = "github:NixOS/nixpkgs/1c872b8c508bbbfebc1b0b74777ff391ce0a574c";

    import-tree.url = "github:denful/import-tree";
    flake-parts.url = "github:hercules-ci/flake-parts";

    lanzaboote.url = "github:nix-community/lanzaboote";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    hypr-kdeconnect-fix.url = "github:boscovn/hypr-kdeconnect-fix-flake";
    hypr-kdeconnect-fix.inputs.nixpkgs.follows = "nixpkgs";

    umbriel.url = "github:noctalia-dev/umbriel/cachix"; # Do not set umbriel.inputs.nixpkgs.follows when using the binary cache.

    nixos-hardware.url = "github:NixOS/nixos-hardware/d9da8426d86bd7e937226f5ecef1df1504ead2e8";
    nixos-hardware.inputs.nixpkgs.follows = "nixpkgs";

    inputs.hexecute.url = "github:m31-galaxy/Hexecute";
    hexecute.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.flake-parts.flakeModules.modules
        (inputs.import-tree ./modules)
      ];
    };
}
