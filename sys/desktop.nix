{ pkgs, lib, ... }:

{
   # Enable the Plasma 5 Desktop Environment.
  services.xserver.enable = true;
<<<<<<< HEAD
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.pantheon.enable = true;
  services.xserver.displayManager.lightdm.greeters.pantheon.enable = true;
  
  #services.xserver.displayManager.defaultSession = "none+xmonad";
=======
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  services.xserver.displayManager.defaultSession = "none+xmonad";
>>>>>>> 7f5db9b7f084e2873c5b077b77e4a2677f8c6e9a

  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    # config = ../.xmonad/xmonad.hs;
    extraPackages = haskellPackages: [
       # haskellPackages.dmenu
        haskellPackages.xmonad
  	haskellPackages.xmonad-contrib
 	haskellPackages.monad-logger
        haskellPackages.xmonad-extras
        haskellPackages.xmonad-wallpaper
    ];
  };
  

}
