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

  programs.wayfire.plugins = with pkgs.wayfirePlugins; [
    wcm
    wf-shell
    wayfire-plugins-extra
    windecor
    firedecor
  ];
}
