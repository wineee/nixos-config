{ inputs, system, pkgs, lib, ... }:

{
  services = {
    xserver = {
    displayManager.sddm.enable = true;
      enable = true;
      desktopManager.mate = {
        enable = true;
        enableWaylandSession = true;
      };
    };
  };
}
