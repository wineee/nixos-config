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
      ./users.nix
      ./virtualisation.nix
      #./extrahosts.nix
      #./auto.nix
    ];
}
