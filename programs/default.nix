{ config, pkgs, lib, ... }:
{
  imports =
    [
      ./shell.nix
    ];

  programs.kdeconnect = {
    enable = true;
  };

  #programs.nix-ld.enable = true;
  programs.command-not-found.enable = true;
  programs.sway.enable = true;
}
