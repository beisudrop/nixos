self: super: {
  quickshell = super.quickshell.overrideAttrs (old: {
    buildInputs = old.buildInputs ++ [ self.qt6.qtimageformats ];
  });

  openldap = super.openldap.overrideAttrs {
    doCheck = !super.stdenv.hostPlatform.isi686;
  };
}
