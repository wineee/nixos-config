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
        sessionPackages = [ pkgs.wayfire ];
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
