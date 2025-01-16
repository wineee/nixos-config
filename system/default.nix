{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./base.nix
      ./boot.nix
      ./fonts.nix
      ./keyboard.nix
      ./i18n.nix
      ./network.nix
      ./virtualisation.nix
    ];
}
