{ pkgs, lib, ... }:

{
  #qt = {
  #  enable = true;
  #  style = "adwaita";
  #  platformTheme = "qt5ct";
  #};
  #environment.variables.QT_QPA_PLATFORMTHEME = lib.mkForce "qt5ct"; 
  services.dbus.enable = true;
  services.notify-daemon.enable = true;
  # a DBus service that provides power management support to applications
  services.upower.enable = true;
  systemd.services.upower.enable = true;
  # use nmcil/nmtui to manager network 
  programs.nm-applet.enable = true;
  # enable blueman to manager bluetooth
  services.blueman.enable = true;
}
