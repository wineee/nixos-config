{ pkgs, lib, config, ... }:

{
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # gtk portal needed to make gtk apps happy
  };

  programs.xwayland.enable = true;

  programs.nm-applet.enable = true;

  programs.waybar.enable = true;

  services = {
    xserver = {
      displayManager = {
        #lightdm.enable = true;
        sddm.enable = true;
        sessionPackages = [ pkgs.wayfire ];
        defaultSession = lib.mkForce "wayfire";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    fluent-icon-theme
    wayfire
    wcm
    wlsunset
    mako
    kanshi
    swaybg
    swayidle
    swaylock
    xrdp
    grim
    wmctrl
    wlogout
    wl-clipboard
  ];
}
