{ stdenv
, lib
, fetchFromGitHub
, meson
, ninja
, pkg-config
, cmake
, wayland
, wrapGAppsHook
, gtk3
, gtkmm3
, libevdev
, libxml2
, libdrm
, libinput
, wayfire
, wayland-protocols
, wf-shell
, scour
, libepoxy
}:

stdenv.mkDerivation rec {
  pname = "wcm";
  version = "unstable-2023-02-19";

  src = fetchFromGitHub {
    owner = "WayfireWM";
    repo = pname;
    rev = "09511f10020c9d7ea5a50d1dd2927c6669595a9c";
    fetchSubmodules = true;
    sha256 = "sha256-ZFOf6e7tYmcezeYDhLPibHKTPZRxNBV4QUw+fNQeWBU=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    cmake
    wayland
    wrapGAppsHook
  ];

  buildInputs = [
    gtk3
    gtkmm3
    libevdev
    libxml2
    wayfire
    wayland
    wayland-protocols
    wf-shell
    scour
    libepoxy
  ];

  meta = with lib; {
    homepage = "https://github.com/WayfireWM/wcm";
    description = "Wayfire Config Manager";
    license = licenses.mit;
    maintainers = with maintainers; [ qyliss wucke13 ];
    platforms = platforms.unix;
  };
}
