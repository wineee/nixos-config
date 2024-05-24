{ pkgs, lib, config, ... }:

{
  imports = [ ./common.nix ];

  programs.gnupg.agent.pinentryPackage = lib.mkForce pkgs.pinentry-qt;
  programs.xwayland.enable = true;
  programs.wayfire.enable = true;
  programs.sway.enable = true;
  programs.hyprland.enable = true;

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
