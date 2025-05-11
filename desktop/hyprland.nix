{ pkgs, lib, ... }:
{
  programs.hyprland.enable = true;

  services.xserver.windowManager.qtile.enable = true;
}
