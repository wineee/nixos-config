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
      ];
      trusted-public-keys = [
      ];
      trusted-users = [ "root" "rewine" ];
    };

    gc = {
      # automatic = true;
      options = "--delete-older-than 5d";
      dates = "05:15";
    };
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
