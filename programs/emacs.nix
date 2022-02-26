{ config, lib, pkgs, ... }:

{
  #nixpkgs.overlays = [
  #  (import (builtins.fetchGit {
  #    url = "https://github.com/nix-community/emacs-overlay.git";
  #    ref = "master";
  #    rev = "043268ac469364214a02918717d74d9a0cc1af3d"; # change the revision
  #  }))
  #];

  services.emacs = {
    install = true;
    enable = true;
    package = pkgs.emacs;
    # defaultEditor = true;
  };

}
