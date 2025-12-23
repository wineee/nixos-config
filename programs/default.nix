{ config, pkgs, lib, ... }:
{
  imports =
    [
      ./shell.nix
    ];

  #programs.nix-ld.enable = true;
  programs.command-not-found.enable = true;
}
