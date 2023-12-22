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
      allowBroken = true;
      permittedInsecurePackages = [ 
        "electron-24.8.6"
        "openssl-1.1.1w"
        "electron-19.1.9"
        "electron-25.9.0"
      ]; #typora
      vivaldi = {
        proprietaryCodecs = true;
        enableWideVine = true;
      };
    };
  };
}
