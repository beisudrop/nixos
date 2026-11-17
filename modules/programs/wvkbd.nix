{
  self,
  lib,
  ...
}:
{
  flake.modules = lib.mkMerge [
    {
      homeManager.wvkbd =
        {
          pkgs,
          ...
        }:
        {
          home.packages = [ pkgs.wvkbd ];
        };
    }
    {
      nixos.wvkbd-overlay = { ... }: {
        nixpkgs.overlays = [
          (self: super: {
            # Bind wl_compositor with the advertised version instead of
            # unconditionally requesting version 6, which libwayland rejects
            # on compositors that only expose version 5.
            wvkbd = super.wvkbd.overrideAttrs (old: {
              postPatch = (old.postPatch or "") + ''
                substituteInPlace main.c \
                  --replace-fail '&wl_compositor_interface, 6' \
                  '&wl_compositor_interface, version < 6 ? version : 6'
              '';
            });
          })
        ];
      };
    }
    {
      nixos.wvkbd = { user, ... }: {
        imports = [ self.modules.nixos.wvkbd-overlay ];
        home-manager.users."${user}".imports = [ self.modules.homeManager.wvkbd ];
      };
    }
  ];
}
