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
      ./network.nix
      ./virtualisation.nix
      #./auto.nix
    ];
}
