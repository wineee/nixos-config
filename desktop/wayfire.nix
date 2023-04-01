{ pkgs, lib, config, ... }:

{
  imports = [ ./common.nix ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # gtk portal needed to make gtk apps happy
  };

  programs.xwayland.enable = true;

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
    waybar

    wlsunset
    mako # 通知
    kanshi
    swaybg
    swayidle
    swaylock
    rofi-wayland

    foot
    networkmanagerapplet

    xrdp
    slurp
    grim
    wmctrl
    wlogout
    wl-clipboard
  ];
}
