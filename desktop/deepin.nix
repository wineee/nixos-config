{ inputs, system, pkgs, lib, ... }:

{
  services = {
    xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      desktopManager.deepin = {
        enable = true;
        full = true;
      };
    };
  };
  environment.deepin.excludePackages = with inputs.dde-nixos.packages.${system}; [
    deepin-image-viewer
    deepin-draw
    deepin-calculator
    deepin-album
    deepin-editor
  ];
  environment.systemPackages = with pkgs.deepin; [
    deepin-image-viewer
    deepin-draw
    deepin-calculator
    deepin-album
    deepin-editor
  ];
}
