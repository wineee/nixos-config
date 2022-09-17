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
      ./modules/v2raya.nix
    ];

  #config.services.v2raya.enable = true;

  #environment.variables = {
  #  QT_QPA_PLATFORM_PLUGIN_PATH = "${pkgs.qt5.qtbase.bin.outPath}/lib/qt-${pkgs.qt5.qtbase.version}/plugins";
  #};

  #programs.tmux.keyMode = emacs;
}



