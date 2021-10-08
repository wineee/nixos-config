{ pkgs, ... }:
with pkgs;
let  
  my-python-packages = python39Packages: with python39Packages; [
      # eaf
      pyqt5 
      pyqtwebengine
      qtconsole
      sip qrcode
      epc
      retry

      # eaf-filemanger
      lxml

      # eaf-system-monitor
      psutil

      # other
      percol
  ]; 
  python-with-my-packages = python39.withPackages my-python-packages;
in
python-with-my-packages
