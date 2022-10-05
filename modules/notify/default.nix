{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.notify-daemon;
in
{
  options = {
    services.notify-daemon = {
      enable = mkEnableOption (lib.mdDoc ''
        Whether to enable notify-daemon
      '');
      package = mkPackageOption pkgs "dunst" { };
      # dunst/deadd-notification-center
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
    systemd.packages = [ cfg.package ];
    services.dbus.packages = [ cfg.package ];
  };
}
