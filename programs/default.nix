{ config, pkgs, lib, ... }:
{
  imports =
    [
      ./alias.nix
      # ./npm.nix
      ./zsh.nix
    ];

  programs.kdeconnect = {
    enable = true;
  };

  programs.nix-ld.enable = true;
}
