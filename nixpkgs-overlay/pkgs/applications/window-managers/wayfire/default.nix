{ lib
, stdenv
, fetchFromGitHub
, cmake
, meson
, ninja
, pkg-config
, cairo
, doctest
, libdrm
, libexecinfo
, libinput
, libjpeg
, libxkbcommon
, wayland
, wayland-protocols
, wlroots
, mesa
, pango
, xorg
, libevdev
, libxml2
, glm
, nlohmann_json
, useSystemWlroots ? true
}:
let
  mesonEnableFeature = b: if b then "enabled" else "disabled";
in
stdenv.mkDerivation rec {
  pname = "wayfire";
  version = "unstable-2023-02-19";

  src = fetchFromGitHub {
    owner = "WayfireWM";
    repo = pname;
    rev = "a1f575701ab3ba41006a38c0a01f39d31fdf2dbb";
    fetchSubmodules = true;
    sha256 = "sha256-9FEHGlyUUPvikmxCRM7kjXtM4y5dYmqf/dw2jxD8RZo";
  };

  nativeBuildInputs = [ 
    cmake
    meson
    ninja
    pkg-config
    wayland
  ];

  buildInputs = [
    doctest
    libdrm
    libexecinfo
    libinput
    libjpeg
    libxkbcommon
    wayland-protocols
    mesa
    xorg.xcbutilwm
    libevdev
    nlohmann_json
  ];

  propagatedBuildInputs = [ 
    cairo
    pango
    glm 
    wlroots
    wayland
    libxml2
  ];

  patches = [
    ./wayfire.diff
  ];

  # CMake is just used for finding doctest.
  dontUseCmakeConfigure = true;

  mesonFlags = [
    "--sysconfdir /etc"
    "-Duse_system_wlroots=${mesonEnableFeature useSystemWlroots}"
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
