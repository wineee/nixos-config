# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let
  unstableTarball =
   fetchTarball
    https://nixos.org/channels/nixpkgs-unstable/nixexprs.tar.xz; 
    # https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz;
  packages = pkgs.callPackage ./packages { };

in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      
      # ./nix      
      
      ./system
      ./system/boot.nix
      ./system/fonts.nix
      ./system/gpu.nix
      ./system/keyboard.nix
      ./system/i18n.nix
      ./system/desktop.nix
      ./system/network.nix
      ./system/users.nix
      ./system/virtualisation.nix
      ./system/auto.nix
    ];

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
      vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; }; 
    };
    nixpkgs.config.vivaldi = {
      proprietaryCodecs = true;
      enableWideVine = true;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = packages; 
  
  # List services that you want to enable:
}
