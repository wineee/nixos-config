{ inputs, config, pkgs, lib, ... }:
let
  my_overlay = [
    (import ./nixpkgs-overlay)
  ];
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
        "electron-9.4.4"
        "qtwebkit-5.212.0-alpha4"
      ]; #typora
      vivaldi = {
        proprietaryCodecs = true;
        enableWideVine = true;
      };
    };
  };
}
