{ config, pkgs, lib, ... }:
{
  nix = {
    package = pkgs.nixUnstable;

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;

      substituters = [
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        "https://mirror.sjtu.edu.cn/nix-channels/store"
        "https://rewine.cachix.org"
      ];
      trusted-public-keys = [
        "rewine.cachix.org-1:aOIg9PvwuSefg59gVXXxGIInHQI9fMpskdyya2xO+7I="
      ];
      trusted-users = [ "root" "rewine" ];
    };

    gc = {
      automatic = false;
      #options = "--delete-older-than 5d";
      #dates = "05:15";
    };

    #extraOptions = ''
    #  keep-outputs = true
    #  keep-derivations = true
    #'';
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
    allowBroken = true;
    permittedInsecurePackages = [ "electron-9.4.4" ]; #typora
    vivaldi = {
      proprietaryCodecs = true;
      enableWideVine = true;
    };
  };
}
