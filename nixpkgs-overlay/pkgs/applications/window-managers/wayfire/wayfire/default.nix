{ lib, stdenv, fetchFromGitHub, cmake, meson, ninja, pkg-config
, cairo, doctest, libdrm, libexecinfo, libinput, libjpeg, libxkbcommon, wayland
, wayland-protocols, wf-config, wlroots, mesa, pango, xorg, glm, libevdev, libxml2
}:

stdenv.mkDerivation rec {
  pname = "wayfire";
  version = "0.7.5";

  src = fetchFromGitHub {
    owner = "WayfireWM";
    repo = pname;
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-Z+rR9pY244I3i/++XZ4ROIkq3vtzMgcxxHvJNxFD9is=";
  };

  nativeBuildInputs = [ cmake meson ninja pkg-config wayland ];

  buildInputs = [
    cairo doctest libdrm libexecinfo libinput libjpeg libxkbcommon wayland
    wayland-protocols wlroots mesa pango xorg.xcbutilwm glm libevdev libxml2
  ];

  propagatedBuildInputs = [ glm ];
  # CMake is just used for finding doctest.
  dontUseCmakeConfigure = true;

  mesonFlags = [ 
    "--sysconfdir /etc"
    "-Duse_system_wlroots=enabled"
    "-Duse_system_wfconfig=disabled"
  ];

  passthru.providedSessions = [ "wayfire" ];

  meta = with lib; {
    homepage = "https://wayfire.org/";
    description = "3D Wayland compositor";
    license = licenses.mit;
    maintainers = with maintainers; [ qyliss wucke13 ];
    platforms = platforms.unix;
  };
}
