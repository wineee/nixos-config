{ config, pkgs, lib, modulesPath, inputs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./nixconfig.nix

      ./system
      ./modules/systemd
      ./pkgs
      ./programs
    ];

  environment.variables = {
    QT_QPA_PLATFORM_PLUGIN_PATH = "${pkgs.qt5.qtbase.bin.outPath}/lib/qt-${pkgs.qt5.qtbase.version}/plugins";
  };

  #programs.tmux.keyMode = emacs;
}



