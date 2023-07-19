{ stdenv
, lib
, fetchFromGitHub
, meson
, ninja
, pkg-config
, wayfire
, wf-config
, gtkmm3
, gtk-layer-shell
, libxkbcommon
, xorg
}:

stdenv.mkDerivation rec {
  pname = "wayfire-plugins-extra";
  version = "0.7.5";

  src = fetchFromGitHub {
    owner = "WayfireWM";
    repo = pname;
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-hnsRwIrl0+pRKhRlrF/Wdlu6HkzLfYukGk4Hzx3wNeo=";
  };

  postPatch = ''
    substituteInPlace metadata/meson.build \
      --replace "wayfire.get_variable(pkgconfig: 'metadatadir')" "join_paths(get_option('prefix'), 'share/wayfire/metadata')"
  '';

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
  ];

  buildInputs = [
    wayfire
    wf-config
    libxkbcommon
    xorg.xcbutilwm
    gtkmm3
    gtk-layer-shell
  ];

  mesonFlags = [ "--sysconfdir /etc" ];

  meta = with lib; {
    homepage = "https://github.com/WayfireWM/wayfire-plugins-extra";
    description = "Additional plugins for Wayfire";
    license = licenses.mit;
    maintainers = with maintainers; [ rewine ];
    platforms = platforms.unix;
  };
}
