{ config, pkgs, lib, ... }:
{
  imports =
    [
      ./shell.nix
    ];

  programs.kdeconnect = {
    enable = true;
  };

  programs.nix-ld.enable = true;
}
