{ lib, pkgs }:
let
  packages = self:
    let
      inherit (self) callPackage;
    in
    {
      wcm = callPackage ./wcm.nix { };
      wf-shell = callPackage ./wf-shell.nix { };
      wayfire-plugins-extra = callPackage ./wayfire-plugins-extra.nix { };
    };
in
lib.makeScope pkgs.newScope packages
