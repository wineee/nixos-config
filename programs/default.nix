{ config, pkgs, lib, ... }:
{
  imports =
    [
      ./shell.nix
    ];

  #programs.nix-ld.enable = true;
  programs.command-not-found.enable = true;
  programs.sway.enable = true;

  services.clamav.scanner.enable = true;
  services.clamav.daemon.enable = true;
  services.clamav.updater.enable = true;
}
