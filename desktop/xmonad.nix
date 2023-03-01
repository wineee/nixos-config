{ pkgs, lib, ... }:
{
  imports = [ ./commmon.nix ];

  services = {
    xserver = {
      enable = true;

      displayManager = {
        # sddm.enable = true;
        defaultSession = "none+xmonad";
      };
      ### xmonad
      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
        # config = ../.xmonad/xmonad.hs;
        extraPackages = hp: [
          #hp.dmenu
          hp.xmonad
          hp.xmonad-contrib
          hp.monad-logger
          hp.xmonad-extras
          hp.dbus
          #hp.xmonad-wallpaper
        ];
      };
    };
  };
  
  services.betterlockscreen.enable = true;
}
