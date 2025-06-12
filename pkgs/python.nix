{ pkgs, ... }:
with pkgs;
let
  my-python-packages = python3Packages: with python3Packages; [
    tkinter
    # other
    pip
    uv
    qtawesome
  ];
  python-with-my-packages = python3.withPackages my-python-packages;
in
python-with-my-packages
