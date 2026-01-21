{ pkgs, lib, ... }:
{
  services.xserver.enable = true;
  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };
}
