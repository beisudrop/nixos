self: super: {
  #  quickshell = super.quickshell.overrideAttrs (old: {
  #    buildInputs = old.buildInputs ++ [ self.qt6.qtimageformats ];
  #  });

  #  openldap = super.openldap.overrideAttrs {
  #    doCheck = !super.stdenv.hostPlatform.isi686;
  #  };
  azahar = super.azahar.overrideAttrs (oldAttrs: {
    postPatch = (oldAttrs.postPatch or "") + ''
      sed -i '1i#include <cstring>' src/audio_core/cubeb_sink.cpp
      sed -i '1i#include <cstring>' src/audio_core/cubeb_input.cpp
    '';
  });
}
