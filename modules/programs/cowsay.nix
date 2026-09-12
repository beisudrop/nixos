{
  self,
  lib,
  ...
}:
{
  flake.modules = lib.mkMerge [
    {
      homeManager.cowsay =
        {
          pkgs,
          ...
        }:
        {
          home.packages = [ pkgs.cowsay ];
        };
    }
    {
      nixos.cowsay-overlay = { ... }: {
        nixpkgs.overlays = [
          (self: super: {
            cowsay = super.cowsay.overrideAttrs (oldAttrs: {
              nativeBuildInputs = (oldAttrs.nativeBuildInputs or [ ]) ++ [ self.makeWrapper ];

              postInstall = (oldAttrs.postInstall or "") + ''
                wrapProgram $out/bin/cowsay --add-flag "-s"
              '';
            });
          })
        ];
      };
    }
    {
      nixos.cowsay = { user, ... }: {
        imports = [ self.modules.nixos.cowsay-overlay ];
        home-manager.users."${user}".imports = [ self.modules.homeManager.cowsay ];
      };
    }
  ];
}
