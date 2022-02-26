{ config, pkgs, lib, modulesPath, inputs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./system
      
      ./modules/systemd

      ./pkgs
      ./programs
    ];

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  nixpkgs.config = {
    allowUnfree = true;

    vivaldi = {
      proprietaryCodecs = true;
      enableWideVine = true;
    };
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; }; 
  };

  environment.variables = {
    QT_QPA_PLATFORM_PLUGIN_PATH = "${pkgs.qt5.qtbase.bin.outPath}/lib/qt-${pkgs.qt5.qtbase.version}/plugins";
  };

  #programs.tmux.keyMode = emacs;
}



