{ config, lib, pkgs, ... }:
{
    imports = [
        ./betterlockscreen_service.nix
    ];

    systemd.targets.machines.enable = true;
    systemd.nspawn."archriscv" = {
      enable = true;
      execConfig = {
        Boot = true;
      };
    };
    systemd.services."systemd-nspawn@archriscv" = {
      enable = true;
      wantedBy = [ "machines.target" ];
    };

    systemd.nspawn."archlinux" = {
      enable = true;
      execConfig = {
        Boot = true;
      };
    };
    systemd.services."systemd-nspawn@archlinux" = {
      enable = true;
      wantedBy = [ "machines.target" ];
    };

}
