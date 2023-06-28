{ inputs, system, pkgs, lib, ... }:

{
  services = {
    xserver = {
      enable = true;
      #displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };
}
