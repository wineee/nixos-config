{ config, lib, pkgs, ... }:
{
    systemd.services."betterlockscreen@rewine" = {
        enable = true;
        path = [ pkgs.betterlockscreen pkgs.coreutils ];
        before = [ "sleep.target" "suspend.target" ];
    	wantedBy = [ "sleep.target" "suspend.target" ];
        description = "Lock screen when going to sleep/suspend";
        environment = {
	    DISPLAY=":0";
        };
        serviceConfig = {
	    Type = "simple";
            User = "%I";
            WorkingDirectory="/home/rewine";
            ExecStart = "${pkgs.betterlockscreen}/bin/betterlockscreen --lock";
            TimeoutSec = "infinity"; # 0
            ExecStartPost = "${pkgs.coreutils}/bin/sleep 1";
        };
    };
}
