{ pkgs, lib, ... }:

{
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # gtk portal needed to make gtk apps happy
  };

  programs.xwayland.enable = true;

  services = {
    xserver = {
      displayManager.lightdm.enable = true;
      sessionPackages = [ pkgs.wayfire ];
    };
  };

  environment.systemPackages = with pkgs; [
    wayfire
    wcm
    wmctrl
    wlogout
    wl-clipboard
  ];
}
