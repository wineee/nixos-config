{ pkgs, lib, config, ... }:

{
  imports = [ ./common.nix ];

  programs.xwayland.enable = true;
  programs.wayfire.enable = true;

  environment.systemPackages = with pkgs; [
    fluent-icon-theme
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
