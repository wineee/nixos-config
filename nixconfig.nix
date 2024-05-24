{ inputs, config, pkgs, lib, ... }:
{
  nix = {
    package = pkgs.nixVersions.latest;

    nixPath = [ "nixpkgs=${pkgs.path}" ];
    registry.nixpkgs.flake = inputs.nixpkgs;

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;

      substituters = [
        "https://mirrors.bfsu.edu.cn/nix-channels/store"
        #"https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        "https://rewine.cachix.org"
        "https://cache.garnix.io"
      ];
      trusted-public-keys = [
        "rewine.cachix.org-1:aOIg9PvwuSefg59gVXXxGIInHQI9fMpskdyya2xO+7I="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      ];
      trusted-users = [ "root" "rewine" ];
    };

    gc = {
      automatic = false;
      options = "--delete-older-than 5d";
      dates = "05:15";
    };

    #extraOptions = ''
    #  keep-outputs = true
    #  keep-derivations = true
    #'';
  };
}
