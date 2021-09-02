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
            #Environment = "DISPLAY=:0";
            ExecStart = "${pkgs.betterlockscreen}/bin/betterlockscreen --lock";
            TimeoutSec = "infinity";
            ExecStartPost = "${pkgs.coreutils}/bin/sleep 1";
        };
    };
}
