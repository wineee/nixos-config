{ pkgs, lib, ... }:
{
  services = {
    xserver = {
      enable = true;
      desktopManager.budgie.enable = true;
    };
  };
}
