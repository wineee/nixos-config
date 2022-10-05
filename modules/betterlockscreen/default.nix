{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.betterlockscreen;
in
{
  options = {
    services.betterlockscreen = {
      enable = mkEnableOption (lib.mdDoc ''
        Whether to enable betterlockscreen
      '');
    };
  };

  config = mkIf cfg.enable {
    systemd.services."betterlockscreen@rewine" = {
      path = [ pkgs.betterlockscreen pkgs.coreutils ];
      before = [ "sleep.target" "suspend.target" ];
      wantedBy = [ "sleep.target" "suspend.target" ];
      description = "Lock screen when going to sleep/suspend";
      environment = {
        DISPLAY = ":0";
      };
      serviceConfig = {
        Type = "simple";
        User = "%I";
        WorkingDirectory = "/home/rewine";
        ExecStart = "${pkgs.betterlockscreen}/bin/betterlockscreen --lock";
        TimeoutSec = "infinity"; # 0
        ExecStartPost = "${pkgs.coreutils}/bin/sleep 1";
      };
    };
  };
}
