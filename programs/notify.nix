{ config, lib, pkgs, ... }:
let
  package =  pkgs.dunst;  #deadd-notification-center
in
{
  environment.systemPackages = [ package ];
  systemd.packages = [ package ];
  services.dbus.packages = [ package ];
}
