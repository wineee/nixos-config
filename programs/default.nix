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
    package = pkgs.plasma5Packages.kdeconnect-kde; #pkgs.gnomeExtensions.gsconnect
  };

  programs.nix-ld.enable = true;

  services.emacs = {
    enable = true;
    package = pkgs.emacs29;
  };
}
