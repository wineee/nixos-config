{ inputs, system, pkgs, lib, ... }:

{
  services = {
    xserver = {
      enable = true;
      desktopManager.deepin.enable = true;
    };
  };
  environment.deepin.excludePackages = [ 
    # pkgs.deepin.deepin-music
  ];

  programs.gnupg.agent.pinentryPackage = pkgs.pinentry-qt;
}
