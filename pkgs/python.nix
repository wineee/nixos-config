{ pkgs, ... }:
with pkgs;
let
  my-python-packages = python3Packages: with python3Packages; [
    # for eaf
    pyqt5
    pyqtwebengine
    #qtconsole
    sip
    qrcode
    epc
    retry

    # eaf-filemanger
    lxml

    # eaf-system-monitor
    psutil

    # other
    pip
    qtawesome
    percol
  ];
  python-with-my-packages = python3.withPackages my-python-packages;
in
python-with-my-packages
