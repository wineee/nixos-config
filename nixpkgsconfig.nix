{ inputs, config, pkgs, lib, ... }:
let
  my_overlay = (import ./nixpkgs-overlay);
in
{
  nixpkgs = {
    overlays = [
      my_overlay
      inputs.nur.overlays.default
    ];
    config = {
      allowUnfree = true;
      allowBroken = true;
      vivaldi = {
        proprietaryCodecs = true;
        enableWideVine = true;
      };
    };
  };
}
