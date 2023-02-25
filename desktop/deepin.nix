{ inputs, system, pkgs, lib, ... }:

{
  services = {
    xserver = {
      enable = true;
      #displayManager.lightdm.enable = true;
      desktopManager.deepin = {
        enable = true;
        full = true;
      };
    };
  };
}
