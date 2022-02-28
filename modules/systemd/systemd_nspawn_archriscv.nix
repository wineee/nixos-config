{ config, lib, pkgs, ... }:
{
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
}

