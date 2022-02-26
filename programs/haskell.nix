{ config, lib, pkgs, ... }:

{
  services.hoogle = {
    enable = true;
    # packages = (hpkgs: with hpkgs; [text cryptonite]);
    haskellPackages = pkgs.haskellPackages;
  };
}
