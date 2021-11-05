{ pkgs, lib, ... }:

{
  qt5 = {
    enable = true;
    style = "adwaita";
    platformTheme = "gnome";
  };
  #programs.qt5ct.enable = true;

  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.defaultSession = "none+xmonad";
  services.xserver.desktopManager.plasma5.enable = true;  

  # a DBus service that provides power management support to applications
  services.upower.enable = true;  
  
  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    # config = ../.xmonad/xmonad.hs;
    extraPackages = haskellPackages: [
        #haskellPackages.dmenu
        haskellPackages.xmonad
  	haskellPackages.xmonad-contrib
 	haskellPackages.monad-logger
        haskellPackages.xmonad-extras
        haskellPackages.xmonad-wallpaper
    ];
  };
}
