{ stdenv
, lib
, fetchFromGitHub
, meson
, ninja
, pkg-config
, cmake
, wayland-protocols
, alsa-lib
, gtkmm3
, libxkbcommon
, gtk-layer-shell
, pulseaudio
, wayfire
, xorg
}:

stdenv.mkDerivation rec {
  pname = "wayfire-plugins-extra";
  version = "unstable-2023-02-19";

  src = fetchFromGitHub {
    owner = "WayfireWM";
    repo = pname;
    rev = "dc39702661adf005c9c30e6b83729550fadb49d7";
    fetchSubmodules = true;
    sha256 = "sha256-bY8vjkytqO0vWaY2CJXxY+EEUUSiq744x029WWGbnIk=";
  };

  postPatch = ''
    substituteInPlace metadata/meson.build \
      --replace "wayfire.get_variable(pkgconfig: 'metadatadir')" "join_paths(get_option('prefix'), 'share/wayfire/metadata')"
  '';

  nativeBuildInputs = [ 
    meson
    ninja
    pkg-config
    cmake
    #wayland
  ];

  buildInputs = [
    #alsa-lib
    gtkmm3
    libxkbcommon
    #gtk-layer-shell
    #pulseaudio
    wayland-protocols
    wayfire
    xorg.xcbutilwm
  ];

  mesonFlags = [ "--sysconfdir /etc" ];

  meta = with lib; {
    homepage = "https://github.com/WayfireWM/wf-shell";
    description = "GTK3-based panel for Wayfire";
    license = licenses.mit;
    maintainers = with maintainers; [ qyliss wucke13 ];
    platforms = platforms.unix;
  };
}
