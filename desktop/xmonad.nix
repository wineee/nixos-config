{ pkgs, lib, ... }:
{
  services = {
    xserver = {
      enable = true;

      displayManager = {
        sddm.enable = true;
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
  qt5 = {
    enable = true;
    style = "adwaita";
    platformTheme = "gnome";
  };
  qt5.platformTheme = "qt5ct";
  
  services.betterlockscreen.enable = true;
  services.notify-daemon.enable = true;

   # a DBus service that provides power management support to applications
  services.upower.enable = true;
  systemd.services.upower.enable = true;

  # use nmcil/nmtui to manager network 
  programs.nm-applet.enable = true;
}
