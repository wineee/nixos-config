{ inputs, system, pkgs, lib, ... }:

{
  programs.labwc.enable = true;
  services = {
    xserver = {
      enable = true;
      desktopManager.lxqt = {
        enable = true;
        # enableWaylandSession = true;
      };
    };
  };
}
