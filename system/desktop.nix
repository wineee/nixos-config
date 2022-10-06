{ pkgs, lib, ... }:

{
  qt5 = {
    #  enable = true;
    #  style = "adwaita";
    #  platformTheme = "gnome";
  };
  #programs.qt5ct.enable = true;
  services.betterlockscreen.enable = true;
  services.notify-daemon.enable = true;

  services = {
    xserver = {
      enable = true;

      displayManager = {
        sddm.enable = true;
        defaultSession = "none+xmonad";
      };

      ### kde plasma
      desktopManager.plasma5.enable = true;

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

  # a DBus service that provides power management support to applications
  services.upower.enable = true;
  systemd.services.upower.enable = true;
}
