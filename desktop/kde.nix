{ pkgs, lib, ... }:
{
  services = {
    xserver = {
      enable = true;
      displayManager = {
        sddm.enable = true;
      };
      ### kde plasma
      desktopManager.plasma5.enable = true;
    };
  };
}
