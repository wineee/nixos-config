{ config, pkgs, lib, ... }:
{
  imports =
    [
      ./emacs.nix
      ./nvim.nix
      ./git.nix
      ./alias.nix
      ./npm.nix
      ./zsh.nix
    ];

  programs.kdeconnect = {
    enable = true;
    package = pkgs.kdeconnect; #pkgs.gnomeExtensions.gsconnect
  };

  programs.nix-ld.enable = true;
}
