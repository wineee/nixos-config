{ stdenv
, lib
, fetchFromGitHub
, meson
, ninja
, pkg-config
, cmake
, wayland
, alsa-lib
, gtkmm3
, gtk-layer-shell
, pulseaudio
, wayfire
}:

stdenv.mkDerivation rec {
  pname = "wf-shell";
  version = "unstable-2023-02-19";

  src = fetchFromGitHub {
    owner = "WayfireWM";
    repo = pname;
    rev = "c9639087aca3ad69bbd8f56f4213768639b4c8d0";
    fetchSubmodules = true;
    sha256 = "sha256-eCga6ZdxqJYKc9yAI77fZUXOSaee8ijCE0XiJRJtDAg";
  };

  nativeBuildInputs = [ 
    meson
    ninja
    pkg-config
    cmake
    wayland
  ];

  buildInputs = [
    alsa-lib
    gtkmm3
    gtk-layer-shell
    pulseaudio
    wayfire
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
