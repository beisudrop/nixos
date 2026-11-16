{
  self,
  ...
}:
{
  flake.modules = {
    homeManager.umbriel =
      {
        config,
        pkgs,
        host,
        ...
      }:
      {
        home.packages = with pkgs; [
          grim
          slurp
          wl-clipboard
        ];
        # home.file.".config/umbriel/config.toml".source = ./${host}.toml;
      };

    nixos.umbriel =
      {
        user,
        pkgs,
        inputs,
        ...
      }:
      {
        imports = [ inputs.umbriel.nixosModules.default ];
        programs.umbriel.enable = true;
        services.getty.autologinUser = "${user}";
        environment.loginShellInit = ''
          if [ "$(tty)" = "/dev/tty1" ]; then
            umbriel
          fi
        '';
        home-manager.users."${user}".imports = [ self.modules.homeManager.umbriel ];
      };
  };
}
