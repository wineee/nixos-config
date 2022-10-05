{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./base.nix
      ./boot.nix
      ./fonts.nix
      ./gpu.nix
      ./keyboard.nix
      ./i18n.nix
      ./desktop.nix
      ./network.nix
      ./virtualisation.nix
      #./auto.nix
    ];
}
