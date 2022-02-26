{ config, lib, pkgs, ... }:

{
  programs.npm.enable = true;
  programs.npm.package = pkgs.nodePackages.npm;

}
