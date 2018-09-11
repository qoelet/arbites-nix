with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "arbites-env";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    mono54
    gtk2-x11
    gtk-sharp-2_0
    pkgconfig
  ];

  shellHook = ''
    export MONO_GAC_PREFIX=${gtk-sharp-2_0}:\$MONO_GAC_PREFIX
    export LD_LIBRARY_PATH=${gtk-sharp-2_0}/lib:${gtk2-x11}/lib:\$LD_LIBRARY_PATH
  '';
}
