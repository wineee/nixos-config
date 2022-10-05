{ config, pkgs, lib, ... }:
{
  imports =
    [
      #./emacs.nix
      ./nvim.nix
      ./git.nix
      ./alias.nix
      ./npm.nix
      ./zsh.nix
    ];

  programs.kdeconnect = {
    enable = true;
    package = pkgs.plasma5Packages.kdeconnect-kde; #pkgs.gnomeExtensions.gsconnect
  };

  programs.nix-ld.enable = true;

  programs.xonsh.enable = true;
}
