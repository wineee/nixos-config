{ inputs, system, pkgs, lib, ... }:

{
  services = {
    xserver = {
      enable = true;
      desktopManager.deepin.enable = true;
    };
  };
}
