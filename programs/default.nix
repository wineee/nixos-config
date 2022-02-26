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
}
