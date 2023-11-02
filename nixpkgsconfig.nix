{ inputs, config, pkgs, lib, ... }:
let
  my_overlay = (import ./nixpkgs-overlay);
in
{
  nixpkgs = {
    overlays = [
      my_overlay
      inputs.nur.overlay
    ];
    config = {
      allowUnfree = true;
      # allowUnsupportedSystem = true;
      # allowBroken = true;
      permittedInsecurePackages = [ 
        "electron-24.8.6"
      ]; #typora
      vivaldi = {
        proprietaryCodecs = true;
        enableWideVine = true;
      };
    };
  };
}
