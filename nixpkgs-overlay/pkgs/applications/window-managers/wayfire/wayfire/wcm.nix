{ stdenv, lib, fetchFromGitHub, meson, ninja, pkg-config, cmake, wayland, wrapGAppsHook
, gtk3, libevdev, libxml2, libdrm, libinput, wayfire, wayland-protocols, wlroots, wf-config, wf-shell
, libxkbcommon, doctest, xorg
}:

stdenv.mkDerivation rec {
  pname = "wcm";
  version = "0.7.5";

  src = fetchFromGitHub {
    owner = "WayfireWM";
    repo = pname;
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-Z+rR9pY244I3i/++XZ4ROIkq3vtzMgcxxHvJNxFD9is=";
  };

  nativeBuildInputs = [ meson ninja pkg-config cmake wayland wrapGAppsHook ];
  buildInputs = [
    gtk3 libevdev libxml2 libdrm libinput wayfire wayland
    wayland-protocols wlroots wf-shell
    libxkbcommon doctest xorg.xcbutilwm
  ];

  meta = with lib; {
    homepage = "https://github.com/WayfireWM/wcm";
    description = "Wayfire Config Manager";
    license = licenses.mit;
    maintainers = with maintainers; [ qyliss wucke13 ];
    platforms = platforms.unix;
  };
}
